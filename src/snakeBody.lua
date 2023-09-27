snakeBody = {}
snakeBody.currentPosition = require("src/position")
snakeBody.tail = {}

function snakeBody:currentX()
    return self.currentPosition.x
end

function snakeBody:currentY()
    return self.currentPosition.y
end

function snakeBody:right(speed)
    self.currentPosition:right(speed)
end

function snakeBody:left(speed)
    self.currentPosition:left(speed)
end

function snakeBody:down(speed)
    self.currentPosition:down(speed)
end

function snakeBody:up(speed)
    self.currentPosition:up(speed)
end

function snakeBody:limitPosition(offset) 
    if self.currentPosition.x > 480 - offset then
        self.currentPosition.x = 0
    elseif self.currentPosition.x < 0 then
        self.currentPosition.x = 480 - offset
    end

    if self.currentPosition.y > 272 - offset then
        self.currentPosition.y = 0
    elseif self.currentPosition.y < 0 then
        self.currentPosition.y = 240
    end
end

return snakeBody