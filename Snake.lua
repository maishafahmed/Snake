local Snake = {}

Snake.X = 0
Snake.Y = 0
Snake.Direction = 'Right'
Snake.DirectionX = 0
Snake.DirectionY = 0
Snake.Length = 0
Snake.Tail = {}
Snake.LastX = 0
Snake.LastY = 0

function Snake:Move()
  
  if Snake.Direction == 'Up' and Snake.DirectionY == 0 then
    Snake.DirectionX = 0; Snake.DirectionY = -1
  elseif Snake.Direction == 'Down' and Snake.DirectionY == 0 then
    Snake.DirectionX = 0; Snake.DirectionY = 1
  elseif Snake.Direction == 'Right' and Snake.DirectionX == 0 then
    Snake.DirectionX = 1; Snake.DirectionY = 0
  elseif Snake.Direction == 'Left' and Snake.DirectionX == 0 then
    Snake.DirectionX = -1; Snake.DirectionY = 0
  end
  
  Snake.LastX = Snake.X
  Snake.LastY = Snake.Y
  
  Snake.X = Snake.X + Snake.DirectionX
  Snake.Y = Snake.Y + Snake.DirectionY
  
  if Snake.X < 0 then Snake.X = 24 end 
  if Snake.X > 24 then Snake.X = 0 end
  if Snake.Y < 0 then Snake.Y = 24 end
  if Snake.Y > 24 then Snake.Y = 0 end
  
  if Snake.Length > 0 then
    for i = 1, Snake.Length do
      local x, y = Snake.Tail[i][1], Snake.Tail[i][2]
      Snake.Tail[i][1], Snake.Tail[i][2] = Snake.LastX, Snake.LastY
      Snake.LastX,Snake.LastY = x, y
    end
  end
  
end

function Snake:Draw()
  love.graphics.setColor(0,1,0,1)
  love.graphics.rectangle('fill',Snake.X*25,Snake.Y*25,15,15)
  
  if Snake.Tail[1] == nil then else 
    for i = 1, Snake.Length do
      love.graphics.rectangle('fill',Snake.Tail[i][1]*25,Snake.Tail[i][2]*25,15,15)
    end
  end
end

return Snake