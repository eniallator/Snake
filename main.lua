function setupVars()
  screenDim = {love.graphics.getDimensions()}
  snake = {size = 0, x = 1, y = 1, speed = {x = 1, y = 0}, newSpeed = {x = 1, y = 0}}
  food = {}
  frameCooldown = 0
  tail = {}
  gridSquareSize = screenDim[2]/30
end

function love.load()
  snakeFuncs = require "lib/snakeFuncs"
  display = require "lib/display"
  game = require "lib/game"

  setupVars()
  game.makeGrid(gridSquareSize)
  game.createFood()
  love.graphics.setFont(love.graphics.newFont(screenDim[1]/40))
end

function love.update()
  snakeFuncs.userInput()

  if frameCooldown == 0 then
    frameCooldown = 15
    game.main()

  else
    frameCooldown = frameCooldown - 1
  end
end

function love.draw()
  display.grid()
  display.score()
end
