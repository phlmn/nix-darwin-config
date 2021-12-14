local grid = require("./grid")
local audio_control = require("./audio_control")
local window_management = require("./window_management")

local log = hs.logger.new('init', 'debug')

-- window management
hs.grid.setGrid('8x6')
hs.grid.setMargins("5 5")

hs.hotkey.bind({"cmd", "ctrl"}, "F", function()
  window_management.toggleFullscreen()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  grid.showGrid()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "C", function()
  window_management.toggleCenter()
end)

-- audio
audio_control.enableNetworkVolumeControl('Sure USB DAC1   ')
