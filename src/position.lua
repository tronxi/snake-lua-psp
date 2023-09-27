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

function position:limitPosition(offset) 
    if self.x > 480 - offset then
        self.x = 0
    elseif self.x < 0 then
        self.x = 480 - offset
    end

    if self.y > 272 - offset then
        self.y = 0
    elseif self.y < 0 then
        self.y = 240
    end
end

return position