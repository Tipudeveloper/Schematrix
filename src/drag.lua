local drag = {}

-- Tracks whether the drag operation is currently active
drag.dragging = false

-- Stores the offset between mouse position and top-left corner of the draggable object
drag.dragOffsetX = 0
drag.dragOffsetY = 0

--- Handles mouse press event to initiate dragging if conditions are met
-- @param x number Mouse X coordinate
-- @param y number Mouse Y coordinate
-- @param button number Mouse button pressed (1 = left click)
-- @param arduinoX number Current X position of the Arduino image
-- @param arduinoY number Current Y position of the Arduino image
-- @param arduinoWidth number Width of the Arduino image
-- @param arduinoHeight number Height of the Arduino image
-- @param dragModeOn boolean Indicates whether dragging is enabled
function drag.mousepressed(x, y, button, arduinoX, arduinoY, arduinoWidth, arduinoHeight, dragModeOn)
    if button == 1 and dragModeOn then
        -- Check if mouse is within the bounds of the Arduino image
        if x >= arduinoX and x <= arduinoX + arduinoWidth and y >= arduinoY and y <= arduinoY + arduinoHeight then
            drag.dragging = true
            -- Calculate and store the offset so the image won't jump to mouse position instantly
            drag.dragOffsetX = x - arduinoX
            drag.dragOffsetY = y - arduinoY
        end
    end
end

--- Handles mouse release event to stop dragging
-- @param button number Mouse button released
function drag.mousereleased(button)
    if button == 1 then
        -- Stop dragging immediately upon mouse button release
        drag.dragging = false
    end
end

--- Handles mouse movement during dragging and calculates new position
-- @param x number Current mouse X coordinate
-- @param y number Current mouse Y coordinate
-- @param dragModeOn boolean Indicates whether dragging is enabled
-- @return number, number New X and Y coordinates for the draggable object or nil if not dragging
function drag.mousemoved(x, y, dragModeOn)
    if drag.dragging and dragModeOn then
        -- Calculate new position based on mouse movement and stored offset
        return x - drag.dragOffsetX, y - drag.dragOffsetY
    end
    -- Return nils if not dragging, indicating no position update
    return nil, nil
end

return drag
