function love.load()
    love.window.setTitle("Schematrix desktop")
    arduino = love.graphics.newImage("src/assets/ArduinoUno.png")
end

function love.update()
end

function love.draw()
    love.graphics.draw(arduino, 300, 200)
end
