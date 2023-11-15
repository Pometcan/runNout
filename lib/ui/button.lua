require("lib/sprite/sprite")
require("lib/ui/collision")
local btnSprite = sprite:create({img = "asset/pic/btn.png",row=2,col=0,w=128,h=64})

function ui:createButton(stuff)
  local w,h
  if stuff.sprite ~= nil then
    w,h = stuff.sprite[1]:getTextureDimensions()
  else
    w,h = btnSprite[1]:getTextureDimensions()
  end

  local btn = {
    name = stuff.name or self:autoname("btn"),
    type = "btn",
    on = stuff.on or {1,2,3,1},
    text = stuff.text or "",
    aling = stuff.aling or "center",
    x = stuff.x or 0, y = stuff.y or 0,
    event = stuff.event or {},
    sprite = stuff.sprite or btnSprite,
    w=w/3,h=h,
    scale = stuff.scale or 1,
    rotate = stuff.rotate or 0,
    enable = stuff.enable or true,
    visible = stuff.visible or true,
    color = stuff.color or {1,1,1,1},
    opact = stuff.opact or 1
  }
  btn.color[4] = btn.opact
  table.insert(self,btn)
  return self:source(btn.name)
end

function ui:drawButton(btn)
  if btn.color ~= nil then
    love.graphics.setColor(unpack(btn.color))
  end
  if btn.visible == true then
    love.graphics.draw(btn.sprite.img,btn.sprite[btn.on[4]],btn.x,btn.y,btn.rotate,btn.scale)
  else
    btn.enable = false
  end
  local btny = btn.y
  if btn.on[4] == 2 then
    btny = btny+4
  end
  if btn.visible == true then
    love.graphics.printf(btn.text,btn.x,btn.y+(Font:getHeight()/2)+4,btn.w,btn.aling,btn.rotate,btn.scale)
  end
end

function ui:updateButton(btn)
  local mouse = {x=control.mouse.x,y=control.mouse.y,w = 1,h = 1,scale = 1}
  if btn.enable == true then
    if control.mouse.pressed.btn == 1 and rectCollisions(btn,mouse) then
      btn.on[4] = 3
      if control.mouse.released.btn == 1 then
        if btn.event.onclick ~= nil then
          btn.event.onclick()
        end
      end
    elseif rectCollisions(btn,mouse) then
      btn.on[4] = 2
      if btn.event.hover ~= nil then
        btn.event.hover()
      end
    else
      btn.on[4] = 1
    end
  end
end
