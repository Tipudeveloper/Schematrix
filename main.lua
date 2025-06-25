-- Import modules from src directory
local drag = require("src/drag")
local dock = require("src/dock")
local arduino = require("src/arduino")

--- Runs once at the start, initializes window and modules
function love.load()
    love.window.setTitle("Schematrix desktop")
    arduino.load()           -- Load Arduino image and set initial position

    -- Initialize drag module state
    drag.dragging = false
    drag.dragOffsetX = 0
    drag.dragOffsetY = 0

    -- Control whether dragging is enabled or disabled
    dragModeOn = false
end

function love.update(dt)
    -- No continuous update logic needed at the moment
end

--- Handles mouse press events
-- @param x number Mouse X coordinate
-- @param y number Mouse Y coordinate
-- @param button number Mouse button pressed
function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button only
        -- Check if user clicked on the drag toggle button in the dock
        if dock.isButtonPressed(x, y) then
            dragModeOn = not dragModeOn     -- Toggle drag mode on/off
            drag.dragging = false            -- Stop any ongoing drag immediately
            return                          -- Skip further processing
        end

        -- Retrieve Arduino position and size for drag collision detection
        local ax, ay = arduino.getPosition()
        local aw, ah = arduino.getSize()

        -- Pass event to drag module to start drag if applicable
        drag.mousepressed(x, y, button, ax, ay, aw, ah, dragModeOn)
    end
end

--- Handles mouse release events
-- @param x number Mouse X coordinate
-- @param y number Mouse Y coordinate
-- @param button number Mouse button released
function love.mousereleased(x, y, button)
    -- Notify drag module to end drag operation if any
    drag.mousereleased(button)
end

--- Handles mouse movement events
-- @param x number Current mouse X coordinate
-- @param y number Current mouse Y coordinate
-- @param dx number Delta X since last move
-- @param dy number Delta Y since last move
function love.mousemoved(x, y, dx, dy)
    -- Ask drag module for new position if dragging is active
    local nx, ny = drag.mousemoved(x, y, dragModeOn)
    if nx and ny then
        arduino.setPosition(nx, ny)  -- Update Arduino position accordingly
    end
end

--- Main draw callback, renders dock and Arduino image
function love.draw()
    arduino.draw()         -- Draw Arduino image at its current position
    dock.draw(dragModeOn)  -- Draw top dock including drag toggle button
end
