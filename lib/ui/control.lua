Control = {
  textinput = {
    text = ""
  },
  keyboard = {
    key = "",
    scancode = nil,
    isrepeat = false,
    released = {
      key = "",
      scancode = nil
    }
  },
  mouse = {
    x = love.graphics.getWidth()/2,
    y = love.graphics.getHeight()/2,
    dx = 0,
    dy = 0,
    pressed = {
      x = 0,
      y = 0,
      btn = 0
    },
    released = {
      x = 0,
      y = 0,
      btn = 0
    }
  },
  touch = {
    id = 0,
    x = 0,
    y = 0,
    dx = 0,
    dy = 0,
    pressure = 0,
    pressed = {
      id = 0,
      x = 0,
      y = 0,
      dx = 0,
      dy = 0,
      pressure = 0
    },
    released = {
      id = 0,
      x = 0,
      y = 0,
      dx = 0,
      dy = 0,
      pressure = 0
    }
  }
}

function ui:textinput(t)
  Control.textinput.text = t or Control.textinput.text
end

function ui:keypressed(key,scancode,isrepeat)
  local k = Control.keyboard
  k.key = key or key
  k.scancode = scancode or k.scancode
  k.isrepeat = isrepeat or k.srepeat
end

function ui:keyreleased(key,scancode)
  local k = Control.keyboard.released
  k.key = key or k.key
  k.scancode = scancode or k.scancode
end

function ui:mousemoved(x,y,dx,dy)
  local m = Control.mouse
  m.x = x or m.x
  m.y = y or m.y
  m.dx = dx or m.dx
  m.dy = dy or m.dy
end

function ui:mousepressed(x,y,btn)
  local m = Control.mouse.pressed
  m.x = x or m.x
  m.y = y or m.y
  m.btn = btn or m.btn
end

function ui:mousereleased(x,y,btn)
  local m = Control.mouse.released
  m.x = x or m.x
  m.y = y or m.y
  m.btn = btn or m.btn
end

function ui:touchmoved(id,x,y,dx,dy,pressure)
  local t = Control.touch
  t.id = id or t.id
  t.x = x or t.x
  t.y = y or t.y
  t.dx = dx or t.dx
  t.dy = dy or t.dy
  t.pressure = pressure or t.pressure
end

function ui:touchpressed(id,x,y,dx,dy,pressure)
  local t = Control.touch.pressed
  t.id = id or t.id
  t.x = x or t.x
  t.y = y or t.y
  t.dx = dx or t.dx
  t.dy = dy or t.dy
  t.pressure = pressure or t.pressure
end

function ui:touchreleased(id,x,y,dx,dy,pressure)
  local t = Control.touch.released
  t.id = id or t.id
  t.x = x or t.x
  t.y = y or t.y
  t.dx = dx or t.dx
  t.dy = dy or t.dy
  t.pressure = pressure or t.pressure
end

return Control
