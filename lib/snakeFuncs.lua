local snakeFuncs = {}

snakeFuncs.eatFood = function()
  if snake.x == food.x and snake.y == food.y then
    snake.size = snake.size + 1
    game.createFood()
  end
end

 snakeFuncs.teleport = function()
  if snake.x < 1 then
    snake.x = #grid

  elseif snake.x > #grid then
    snake.x = 1
  end

  if snake.y < 1 then
    snake.y = #grid[1]

  elseif snake.y > #grid[1] then
    snake.y = 1
  end
end

snakeFuncs.checkDeath = function()
  for i=1,#tail do
    if tail[i].x == snake.x and tail[i].y == snake.y then

      return true
    end
  end

  return false
end

snakeFuncs.userInput = function()
  if (love.keyboard.isDown("down") or love.keyboard.isDown("s")) and snake.speed.x ~= 0 then
    snake.newSpeed = {x = 0, y = 1}
  end

  if (love.keyboard.isDown("up") or love.keyboard.isDown("w")) and snake.speed.x ~= 0 then
    snake.newSpeed = {x = 0, y = -1}
  end

  if (love.keyboard.isDown("right") or love.keyboard.isDown("d")) and snake.speed.y ~= 0 then
    snake.newSpeed = {x = 1, y = 0}
  end

  if (love.keyboard.isDown("left") or love.keyboard.isDown("a")) and snake.speed.y ~= 0 then
    snake.newSpeed = {x = -1, y = 0}
  end
end

return snakeFuncs
