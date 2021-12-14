local log = hs.logger.new('audio_control', 'debug')

local watched_device = nil
local request_running = nil

local function startWatchingDevice(device)
  watched_device = device

  watched_device:watcherCallback(function(a,event_name,type,element)
    if request_running then
      log.d("request already running, skipping this one…")
      return
    end

    if event_name == 'mute' then
      -- request_running = true
      muted = hs.audiodevice.current().muted

      -- command = (muted and 'mute' or 'unmute')

      if muted then
        hs.http.asyncPost(
          'http://philipps-room.local/interact/trigger/mute',
          -- '{}',
          nil,
          nil,
          function()
            -- request_running = false
          end
        )
      else
        request_running = true
        volume = hs.audiodevice.current().volume

        hs.http.asyncPost(
          'http://philipps-room.local/interact/trigger/volume',
          string.format('{ "data": %f }', math.max(math.floor(volume), 1)),
          { ['Content-Type'] = 'application/json' },
          function()
            request_running = false
          end
        )
      end
    end

    if event_name == 'vmvc' and volume ~= 0 then
      request_running = true
      volume = hs.audiodevice.current().volume

      hs.http.asyncPost(
        'http://philipps-room.local/interact/trigger/volume',
        string.format('{ "data": %f }', math.max(math.floor(volume), 1)),
        { ['Content-Type'] = 'application/json' },
        function()
          request_running = false
        end
      )
    end
  end)

  watched_device:watcherStart()
end

local function stopWatchingDevice()
  if watched_device ~= nil then
    watched_device:watcherStop()
  end
end

local function updateNetworkVolumeControl(device_name)
  local audio_state = hs.audiodevice.current()

  log.f('Current Audio Device: \'%s\'', audio_state.name)

  if audio_state.name == device_name then
    -- start setting volume via network
    log.d('starting network volume control')
    startWatchingDevice(audio_state.device)
  else
    -- stop setting volume via network
    log.d('stopping network volume control')
    stopWatchingDevice()
  end
end

function enableNetworkVolumeControl(device_name)
  updateNetworkVolumeControl(device_name)

  hs.audiodevice.watcher.setCallback(function(device, action)
    if device == 'dOut' then
      updateNetworkVolumeControl(device_name)
    end
  end)
  hs.audiodevice.watcher.start()
end

return {
  enableNetworkVolumeControl = enableNetworkVolumeControl
}
