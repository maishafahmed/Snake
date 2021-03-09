local Food = require 'Food'
local Snake = require 'Snake'

GameStates = {Active = 'Active', Over = 'Over'}
State = GameStates.Active
Verify = 0

function Start()
  Food:New()
  CoolDown = 15
end

function Update()
  if State == GameStates.Active then
    CoolDown = CoolDown - 1
    if CoolDown <= 0 then Snake:Move(); CoolDown = 15 end
    if Snake.X == Food.X and Snake.Y == Food.Y then
      Food:New()
      Snake.Length = Snake.Length + 1
      table.insert(Snake.Tail,{-10,-10})
    end
    
    if Snake.Length == 0 then else
      for i = 1, Snake.Length do
        if Snake.X == Snake.Tail[i][1] and Snake.Y == Snake.Tail[i][2] then
          State = GameStates.Over
          Verify = 1
        end
      end
    end
  end
end

function KeyPressed(key)
  if key == 'escape' then love.event.quit() end
  if (key == 'up') or (key == 'w') then
    Snake.Direction = 'Up'
  end
  if (key == 'down') or (key == 's')then
    Snake.Direction = 'Down'
  end
  if (key == 'right') or (key == 'd')then
    Snake.Direction = 'Right'
  end
  if (key == "left") or (key == "a") then
    Snake.Direction = 'Left'
  end
  if key == 'space' then GameRestart() end
end

function Draw()
  Snake:Draw()
  Food:Draw()
  love.graphics.setColor(1,1,1,1)
  love.graphics.print('Score: '..Snake.Length)
end

function GameRestart()
  if Verify == 1 then
    Start()
    Snake.X = 0
    Snake.Y = 0
    Snake.Direction = 'Right'
    Snake.DirectionX = 0
    Snake.DirectionY = 0
    Snake.Length = 0
    Snake.Tail = {}
    Snake.LastX = 0
    Snake.LastY = 0
    State = GameStates.Active
    Verify = 0
  end
end