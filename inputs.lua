love.textinput = function(t)
  ui:textinput(t)
end

love.keypressed = function (key)
  ui:keypressed(key)
  player:keypressed(key)
end

love.keyreleased = function(key)
  ui:keyreleased(key)
  player:keyreleased(key)
end

love.mousemoved = function(x,y,dx,dy)
  local gx,gy = Push:toGame(x,y)
  ui:mousemoved(gx,gy,dx,dy)
  player:mouse(gx,gy,dx,dy)
end

love.mousepressed = function(x,y,btn)
  local gx,gy = Push:toGame(x,y)
  ui:mousepressed(gx,gy,btn)
  player:mousepressed(gx,gy,btn)
end

love.mousereleased = function(x,y,btn)
  local gx,gy = Push:toGame(x,y)
  ui:mousereleased(gx,gy,btn)
  player:mousereleased(gx,gy,btn)
end

love.touchmoved = function(id,x,y,dx,dy)
  local gx,gy = Push:toGame(x,y)
  ui:touchmoved(id,gx,gy,dx,dy)
end

love.touchpressed = function(id,x,y,dx,dy)
  local gx,gy = Push:toGame(x,y)
  ui:touchmoved(id,gx,gy,dx,dy)
end

love.touchreleased = function(id,x,y,dx,dy)
  local gx,gy = Push:toGame(x,y)
  ui:touchreleased(id,gx,gy,dx,dy)
end
