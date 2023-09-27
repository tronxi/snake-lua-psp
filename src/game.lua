game = {}
game.speed = 20
game.position = require("src/position")
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
    
        game.snake:blit(game.position.x, game.position.y)

        if buttons.start then
            game.paused = not game.paused
        end
        if buttons.l then
            game.debug = not game.debug
        end
        if not game.paused then
            if buttons.down or buttons.analogy > 0 then
                game.position:down(game.speed)
                game.lastMove = "down"
            elseif buttons.up or buttons.analogy < 0 then
                game.position:up(game.speed)
                game.lastMove = "up"
            elseif buttons.left or buttons.analogx < 0 then
                game.position:left(game.speed)
                game.lastMove = "left"
            elseif buttons.right or buttons.analogx > 0 then
                game.position:right(game.speed)
                game.lastMove = "right"
            end

            if game.lastMove == "down" then
                game.position:down(game.speed)
            elseif game.lastMove == "up" then
                game.position:up(game.speed)
            elseif game.lastMove == "left" then
                game.position:left(game.speed)
            elseif game.lastMove == "right" then
                game.position:right(game.speed)
            end
        else
            screen.print(210, 120, "PAUSED")
        end
        os.delay(100)

        if game.debug then
            game.log(game.position.x..","..game.position.y
            .."\n"..game.lastMove)
        end

        game.position:limitPosition(20)
        screen.flip()
    end

end

return game

