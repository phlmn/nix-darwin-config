local log = hs.logger.new('grid', 'debug')

local canvas = require("hs.canvas")
local modal = require("hs.hotkey").modal

local FADING_TIME = 0.2

local function getCellSize(theScreen)
  local g = hs.grid.getGrid(theScreen)
  local screenframe=hs.grid.getGridFrame(theScreen)
  return hs.geometry.size(screenframe.w / g.w, screenframe.h / g.h)
end

function showGrid()
  local selected_cell = nil
  local ui_elements = {}

  local resizing = modal.new()
  resizing:bind({},'escape',function()log.d('abort move')resizing:exit()end)

  function resizing:entered()
    screen = hs.screen.mainScreen()


    local backdrop = canvas.new(screen:frame()):appendElements(
      {
        action = "fill",
        fillColor = { alpha = 0.4, red = 0.0, green = 0.0, blue = 0.0  },
        type = "rectangle",
      }
    ):show(FADING_TIME)

    table.insert(ui_elements, backdrop)

    local screen_grid = hs.grid.getGrid(screen)
    local cell_size = getCellSize(screen)
    local grid_frame = hs.grid.getGridFrame(screen)

    for hx=0, screen_grid.w - 1, 1 do
      for hy=0, screen_grid.h - 1, 1 do
        local cell_ui = canvas.new(
          { 
            x = grid_frame.x + (hx * cell_size.w),
            y = grid_frame.y + (hy * cell_size.h),
            w = cell_size.w,
            h = cell_size.h 
          }
        ):appendElements(
          {
            action = "fill",
            padding = 2,
            roundedRectRadii = { xRadius = 8, yRadius = 8 },
            fillColor = { alpha = 0.05, red = 1.0, green = 1.0, blue = 1.0  },
            type = "rectangle",
          }
        )

        cell_ui:mouseCallback(function(canvas, event, id, x, y)
          if event == "mouseEnter" then
            cell_ui[1].fillColor = { alpha = 0.8, red = 0.5, green = 0.45, blue = 0.7 }
          elseif event == "mouseExit" then
            cell_ui[1].fillColor = { alpha = 0.05, red = 1.0, green = 1.0, blue = 1.0 }
          elseif event == "mouseDown" then
            log.f("mouse down: %d %d", hx, hy)
            if selected_cell == nil then
              selected_cell = hs.geometry(hx, hy)
            else 
              log.f("resize: %d %d - %d %d", selected_cell.x, selected_cell.y, hx, hy)
              local current_window = hs.window.focusedWindow()
              if current_window ~= nil then
                area = hs.geometry.rect({
                  x1 = selected_cell.x,
                  y1 = selected_cell.y,
                  x2 = hx,
                  y2 = hy,
                })

                area.w = area.w + 1
                area.h = area.h + 1

                hs.grid.set(current_window, area)

                resizing:exit()
              end
            end
          end
        end)
        -- cell_ui._default.trackMouseEnterExit = true
        cell_ui:canvasMouseEvents(true, true, true, false)
        cell_ui:clickActivating(false)

        cell_ui:show(FADING_TIME)
        table.insert(ui_elements, cell_ui)
      end
    end

  end

  function resizing:exited()
    selected_cell = nil
    for _,c in pairs(ui_elements) do
      c:delete(FADING_TIME)
    end
    ui_elements = {}
  end

  resizing:enter()
end

return {
  showGrid = showGrid
}
