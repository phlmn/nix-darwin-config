officeSSID = "Micromata"
folder = "/Users/phlmn/worktime"
jsonVersion = 1;

-- Wifi stuff
wifiWatcher = nil
lastSSID = hs.wifi.currentNetwork()

-- Menu Bar Item
menuBarItem = hs.menubar.new(true)
function clickMenuItem(mod)
    if mod["alt"] then
        -- show times
    else
        -- add note
        local btn, text = hs.dialog.textPrompt("Add Note", "Add a note about what you did at work.", "", "Save", "Cancel")
        if btn == "Save" then
            writeNote(text)
        end
    end
end
menuBarItem:setClickCallback(clickMenuItem)

-- Create Folder
hs.fs.mkdir(folder)

function getDataFile(time)
    return  folder .. "/" .. os.date("%Y-%m", time) .. ".json"
end

function readFile(time)
    local data = {}

    -- Read file and parse JSON
    local file = io.open (getDataFile(time), "rb")
    if file ~= nil then
        local json = file:read("*all")
        file:close()

        local status, val = pcall(function()
            return hs.json.decode(json)
        end)

        if status then
            data = val
        end
    end

    -- init data structure
    if data["version"] == nil then
        data["version"] = jsonVersion
    end

    if data["logs"] == nil then
        data["logs"] = {}
    end

    if data["notes"] == nil then
        data["notes"] = {}
    end

    return data
end

function writeFile(time, data)
    -- encode JSON
    local writeJson = hs.json.encode(data, true)

    -- Write file
    local file, err = io.open (getDataFile(time), "wb")
    if err then
        print(err)
        return
    end
    file:write(writeJson)
    file:close()
end

function writeEvent(event, state)
    local now = os.time()
    local data = readFile(now)

    -- Insert log
    table.insert(data["logs"], {
        ["time"] = os.date("%Y-%m-%dT%H:%M:%S", now),
        ["event"] = event,
        ["state"] = state
    });

    writeFile(now, data)
end

function writeNote(note)
    local now = os.time()
    local data = readFile(now)

    -- Insert log
    table.insert(data["notes"], {
        ["time"] = os.date("%Y-%m-%dT%H:%M:%S", now),
        ["content"] = note
    });

    writeFile(now, data)
end

function changeState(atWork)
    if atWork then
        menuBarItem:setTitle("👷🏻")
    else
        menuBarItem:setTitle("🎮")
    end
end

function init()
    local ssid = hs.wifi.currentNetwork()
    if ssid == officeSSID then
        changeState(true)
    else
        changeState(false)
    end
end
init()


-- Wifi Watcher

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID == officeSSID and lastSSID ~= officeSSID then
        -- We just joined our office WiFi network
        writeEvent("office_wifi", true)
        changeState(true)
    elseif newSSID ~= officeSSID and lastSSID == officeSSID then
        -- We just departed our office WiFi network
        writeEvent("office_wifi", false)
        changeState(false)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()


-- Caffeinate Watcher (for sleep and wake events)

function caffeinateCallback(event)
    if event == hs.caffeinate.watcher.screensDidSleep then
        writeEvent("system_active", false)
    elseif event == hs.caffeinate.watcher.screensDidWake then
        writeEvent("system_active", true)
    end
end

caffeinateWatcher = hs.caffeinate.watcher.new(caffeinateCallback)
caffeinateWatcher:start()