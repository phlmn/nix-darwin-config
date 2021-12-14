local log = hs.logger.new('window_management', 'debug')

windowCache = {}

function isWindowCentered(window)
    threshold = 10

    topLeft = window:topLeft()
    screen = window:screen():frame()

    windowSize = window:size()
    log.d('Window Size: ', windowSize)
    log.d('screen Size: ', screen)
    windowCenterX = topLeft.x + windowSize.w / 2
    windowCenterY = topLeft.y + windowSize.h / 2

    offsetX = (windowCenterX - screen.w / 2)
    offsetY = (windowCenterY - screen.h / 2)

    log.d('Offset X', offsetX)
    return -threshold <= offsetX and offsetX <= threshold
end

function toggleCenter(resize)
    window = hs.window.frontmostWindow()
    log.d('Window centered:', isWindowCentered(window))
    if isWindowCentered(window) and windowCache[window:id()] ~= nil then
        window:setFrame(windowCache[window:id()])
        windowCache[window:id()] = nil
        return false
    else
        windowCache[window:id()] = window:frame()
        if resize then
            window:moveToUnit('[25,5,75,95]')
        else
            window:centerOnScreen(nil, true)
        end
        return true
    end
end

function isFullscreened(window)
    topLeft = window:topLeft()
    screen = window:screen():frame()

    windowSize = window:size()
    log.d('Window Size: ', windowSize)
    log.d('Screen Size: ', screen)
    log.d('Window TopLeft', topLeft)

    return topLeft.x == 0 and topLeft.y < 24 and windowSize.w == screen.w and windowSize.h == screen.h
end

function toggleFullscreen()
    window = hs.window.frontmostWindow()
    log.d('Window fullscreened:', isFullscreened(window))
    if isFullscreened(window) and windowCache[window:id()] ~= nil then
        window:setFrame(windowCache[window:id()])
        windowCache[window:id()] = nil
        return false
    else
        windowCache[window:id()] = window:frame()
        window:moveToUnit('[0,0,100,100]')
        return true
    end
end

return {
    toggleCenter = toggleCenter,
    toggleFullscreen = toggleFullscreen
}
