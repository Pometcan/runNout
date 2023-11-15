
function ui:createLabel(stuff)
  lbl = {
    name = stuff.name or ui:autoname("lbl"),
    type = "lbl",
    text = stuff.text or "",
    visible = stuff.visible or true,
    x = stuff.x or 0,
    y = stuff.y or 0,
    w = stuff.w or 0,
    scale = stuff.scale or 1,
    rotate = stuff.rotate or 0,
    size = stuff.size or 12,
    align = stuff.align or "center",
    color = stuff.color or {1,1,1,1}
  }
  table.insert(self,lbl)
end

function ui:drawLabel(lbl)
  if lbl.color ~= nil then
    love.graphics.setColor(unpack(lbl.color))
  end
  if lbl.visible == true then
    love.graphics.printf(lbl.text,lbl.x,lbl.y+(Font:getHeight()/2)+4,lbl.w,lbl.aling,lbl.rotate,lbl.scale)
  end
end
