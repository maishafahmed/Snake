local Food = {}

Food.X = 0
Food.Y = 0

function Food:New()
  Food.X = love.math.random(24)
  Food.Y = love.math.random(24)
end

function Food:Draw()
  love.graphics.setColor(0.8,0.9,0,1)
  love.graphics.rectangle('fill',Food.X*25,Food.Y*25,15,15)
end

return Food