sprite = {}

function sprite:create(stuff)
  if type(stuff.img) == type("") then
    stuff.img = love.graphics.newImage(stuff.img) 
    stuff.img:setFilter("nearest","nearest")
  end
  local frame = {}
  frame.name = stuff.name
  frame.img = stuff.img
  local framerow = {}
  for i=0,stuff.row-1 do
    for j=0,stuff.col-1 do
      table.insert(framerow,love.graphics.newQuad(j*stuff.w,i*stuff.h,stuff.w,stuff.h,stuff.img:getDimensions()))
    end
    table.insert(frame,framerow)
    framerow = {}
  end
  table.insert(sprite,frame)
  return frame
end

return sprite
