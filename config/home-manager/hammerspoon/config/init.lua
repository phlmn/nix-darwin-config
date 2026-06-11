local audio_control = require("./audio_control")
local window_management = require("./window_management")

local log = hs.logger.new('init', 'debug')

-- window management
hs.hotkey.bind({"cmd", "ctrl"}, "F", function()
  window_management.toggleFullscreen()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  grid.showGrid()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
  window_management.toggleCenter()
end)


-- app shortcuts
window_management.addAppShortcut("1", "Firefox")
window_management.addAppShortcut("2", "Alacritty")
window_management.addAppShortcut("3", "Visual Studio Code")
window_management.addAppShortcut("4", "Zed")
window_management.addAppShortcut("6", "Calendar")
window_management.addAppShortcut("7", "Notion")
window_management.addAppShortcut("8", "Mail")
window_management.addAppShortcut("0", "Music")
window_management.addAppShortcut("F", "Ferdium")
window_management.addAppShortcut("T", "Telegram")
window_management.addAppShortcut("W", "WhatsApp")


-- audio
audio_control.enableNetworkVolumeControl('Sure USB DAC1')
