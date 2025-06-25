local arduino = {}

--- Loads the Arduino image asset and initializes its position
function arduino.load()
    arduino.image = love.graphics.newImage("src/assets/ArduinoUno.png")
    arduino.x = 300 -- Initial horizontal position on the screen
    arduino.y = 200 -- Initial vertical position on the screen
end

--- Draws the Arduino image at its current position and its hitbox rectangle
function arduino.draw()
    love.graphics.setColor(1, 1, 1, 1) -- Reset color to white (no tint)
    love.graphics.draw(arduino.image, arduino.x, arduino.y)

    -- Draw hitbox rectangle around Arduino image -- after debug phase remove lines from here SEE LINE 19
    local w, h = arduino.getSize()
    love.graphics.setColor(1, 0, 0, 1) -- Red color for hitbox, fully opaque
    love.graphics.rectangle("line", arduino.x, arduino.y, w, h)
    -- to here SEE LINE 15
    
    love.graphics.setColor(1, 1, 1, 1) -- Reset color to white for any further drawing
end

--- Returns the current position of the Arduino image
-- @return number x The current X coordinate
-- @return number y The current Y coordinate
function arduino.getPosition()
    return arduino.x, arduino.y
end

--- Sets the position of the Arduino image
-- @param x number New X coordinate
-- @param y number New Y coordinate
function arduino.setPosition(x, y)
    arduino.x = x
    arduino.y = y
end

--- Returns the width and height of the Arduino image
-- @return number width Image width in pixels
-- @return number height Image height in pixels
function arduino.getSize()
    return arduino.image:getWidth(), arduino.image:getHeight()
end

return arduino
