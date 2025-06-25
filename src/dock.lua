local dock = {}

-- Constants defining the size and position of the dock and button
dock.dockHeight = 40
dock.buttonX = 10
dock.buttonY = 5
dock.buttonWidth = 80
dock.buttonHeight = 30

-- Draws the dock (top bar) and the drag mode toggle button
-- @param dragModeOn boolean indicating if drag mode is active
function dock.draw(dragModeOn)
    -- Draw the dock background as a dark grey rectangle spanning the width of the window
    love.graphics.setColor(0.2, 0.2, 0.2, 1)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), dock.dockHeight)

    -- Set button color depending on drag mode status: green if on, red if off
    if dragModeOn then
        love.graphics.setColor(0, 0.7, 0, 1)
    else
        love.graphics.setColor(0.7, 0, 0, 1)
    end
    -- Draw the rectangular button at predefined position and size
    love.graphics.rectangle("fill", dock.buttonX, dock.buttonY, dock.buttonWidth, dock.buttonHeight)

    -- Draw the button label text centered within the button rectangle
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf(dragModeOn and "Drag: ON" or "Drag: OFF", dock.buttonX, dock.buttonY + 7, dock.buttonWidth, "center")
end

-- Checks if a given (x, y) coordinate lies within the drag toggle button area
-- @param x number X coordinate of mouse click
-- @param y number Y coordinate of mouse click
-- @return boolean true if the click is within the button bounds, false otherwise
function dock.isButtonPressed(x, y)
    return x >= dock.buttonX and x <= dock.buttonX + dock.buttonWidth
       and y >= dock.buttonY and y <= dock.buttonY + dock.buttonHeight
end

return dock
