local game = {}

local function updateTail()
  if snakeFuncs.checkDeath() then

    tail = {}
    snake.size = 0
  end

  for i=1,#tail do
    grid[tail[i].x][tail[i].y] = "s"
  end

  if #tail == snake.size then
    table.remove(tail,1)
  end

  if snake.size > #tail then
    table.insert(tail,{x = snake.x, y = snake.y})
  end
end

game.createFood = function()
  food.x = math.random(1,#grid)
  food.y = math.random(1,#grid[1])
end

game.makeGrid = function(size)
  grid = {}

  for x=1, math.floor(screenDim[1]/size) do
    grid[x] = {}

    for y=1, math.floor(screenDim[2]/size)-1 do
      grid[x][y] = "n"
    end
  end
end

game.main = function()
  snake.speed = snake.newSpeed

  game.makeGrid(gridSquareSize)
  snakeFuncs.teleport()
  snakeFuncs.eatFood()
  updateTail()

  grid[snake.x][snake.y] = "s"
  grid[food.x][food.y] = "f"

  snake.x = snake.x + snake.speed.x
  snake.y = snake.y + snake.speed.y
end

return game
