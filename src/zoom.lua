local zoom = {
    scale = 1.0,
    minScale = 0.1,
    maxScale = 5.0
}

function zoom.wheelmoved(x, y)
    if y > 0 then
        zoom.scale = math.min(zoom.scale + 0.1, zoom.maxScale)
    elseif y < 0 then
        zoom.scale = math.max(zoom.scale - 0.1, zoom.minScale)
    end
end

function zoom.apply()
    love.graphics.scale(zoom.scale)
end

function zoom.getScale()
    return zoom.scale
end

return zoom
