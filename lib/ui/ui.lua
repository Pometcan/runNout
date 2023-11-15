ui = {}

Font = love.graphics.newFont("asset/font/west_england.ttf",20)
Font:setFilter("nearest","nearest")
love.graphics.setFont(Font)

control = require("lib/ui/control")
require("lib/ui/button")

function ui:update(dt)
  for _, v in ipairs(self) do
    self:updateButton(v)
  end

  if control.mouse.released.btn >= 1 then
    control.mouse.pressed.btn = 0
  end
  control.mouse.released.btn = 1
end

function ui:draw()
  for _, v in ipairs(self) do
    if v.type == "btn" then
      self:drawButton(v)
    end
  end
end

function ui:source(name)
  local item
  for _,v in ipairs(self) do
    if v.name == name then
      item = v
    end
  end
  return item or {nil}
end

function ui:autoname(type)
  local c = 0
  for _,v in ipairs(self) do
    if type == v.type then
      c = c + 1
    end
  end
  return type..tostring(c)
end
