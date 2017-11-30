local display = {}

local function chooseColour(val)
  if val == "n" then
    love.graphics.setColor(0, 0, 0)

  elseif val == "f" then
    love.graphics.setColor(0,0,200)
    
  else
    love.graphics.setColor(0, 200, 0)
  end
end

display.grid = function()
    for x=1,#grid do
      for y=1,#grid[x] do

        chooseColour(grid[x][y])
        love.graphics.rectangle("fill", (x -1) *gridSquareSize, y *gridSquareSize, gridSquareSize, gridSquareSize)
      end
    end
end

display.score = function()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Score: " .. snake.size)
end

return display
