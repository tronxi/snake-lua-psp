game = {}
game.speed = 20
game.snakeBody = require("src/snakeBody")
game.lastMove = "nothing"
game.paused = false
game.debug = false

if not game.background then 
    game.background = image.load("img/background.png") 
end

if not game.snake then 
    game.snake = image.load("img/snake.png") 
end

function game.log(text)
    screen.print(0,0, text, 0.5, color.black)
end


function game.start()

    collectgarbage()
    color.loadpalette()

    buttons.interval(10,10)

    while true do
        if game.background then 
            game.background:blittint(0,0,color.white) 
        end
    
        buttons.read()
    
        game.snake:blit(game.snakeBody:currentX(), snakeBody:currentY())
        for i,v in ipairs(game.snakeBody.tail) do
            game.snake:blit(v.x, v.y)
        end

        if buttons.start then
            game.paused = not game.paused
        end
        if buttons.l then
            game.debug = not game.debug
        end
        if not game.paused then
            if buttons.down then
                game.snakeBody:down(game.speed)
                game.lastMove = "down"
            elseif buttons.up then
                game.snakeBody:up(game.speed)
                game.lastMove = "up"
            elseif buttons.left then
                game.snakeBody:left(game.speed)
                game.lastMove = "left"
            elseif buttons.right then
                game.snakeBody:right(game.speed)
                game.lastMove = "right"
            end

            if game.lastMove == "down" then
                game.snakeBody:down(game.speed)
            elseif game.lastMove == "up" then
                game.snakeBody:up(game.speed)
            elseif game.lastMove == "left" then
                game.snakeBody:left(game.speed)
            elseif game.lastMove == "right" then
                game.snakeBody:right(game.speed)
            end
        else
            screen.print(210, 120, "PAUSED")
        end
        os.delay(100)

        if game.debug then
            game.log(
            "v0.0.2"
            .."\n"..game.snakeBody:currentX()..","..game.snakeBody:currentY()
            .."\n"..game.lastMove
            .."\n"..#game.snakeBody.tail)
        end

        game.snakeBody:limitPosition(20)
        screen.flip()
    end

end

return game

