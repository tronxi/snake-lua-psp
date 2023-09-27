local position = {}

position.x = 0
position.y = 0

function position:right(speed)
    self.x += speed
end

function position:left(speed)
    self.x -= speed
end

function position:down(speed)
    self.y += speed
end

function position:up(speed)
    self.y -= speed
end

return position