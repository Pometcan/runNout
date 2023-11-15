love.graphics.setDefaultFilter("nearest", "nearest")
require("inputs")
Push = require("lib/push")
Camera = require("lib/camera")
Sprite = require("lib/sprite/sprite")
Anime = require("lib/sprite/anime")
Ui = require("lib/ui/ui")
bullet = require("lib/bullet")
player = require("lib/player")
enamy = require("lib/enemy")
wf = require("lib/windfield")

background = love.graphics.newImage("asset/pic/rooms/room1k1.png")
fullscreenTrue = true
ww,wh = 160,160
Ww, Wh = love.window.getDesktopDimensions()
Push:setupScreen(ww,wh,Ww,Wh,{fullscreen = fullscreenTrue,resizable = true,pixelperfect=true})


function love.load()
  require("lib/world")
  love.mouse.setX(Ww/2)
  love.mouse.setY(Wh/2)
  love.mouse.setVisible(false)
  camera = Camera(0,80,160,160)
  camera:setFollowStyle('SCREEN_BY_SCREEN')
  player:load()
  require("lib/map")
end

function love.update(dt)
  World:update(dt)
  camera:update(dt)
  camera:follow(player.x,player.y)
  bullet:update(dt)
  player:update(dt)
  enemy:update(dt)
  ui:update(dt)
  if love.keyboard.isDown("q") then
    love.event.push("quit")
  end
end

function love.draw()
  --Ekran Boyutlandırma ve kamera
  Push:start()
  camera:attach()
  --arkaplan
  love.graphics.draw(background,0,0)
  --Entityler
  bullet:draw()
  enemy:draw()
  player:draw()
  --kamera
  camera:detach()
  camera:draw()
  -- ui
  ui:draw()
  -- fare
  love.graphics.draw(love.graphics.newImage("asset/pic/Crosshair.png"),math.floor(control.mouse.x-4),math.floor(control.mouse.y-4))
  --collision
  --World:draw()
  Push:finish()
  -- İnfo text
  love.graphics.print("fps: "..love.timer.getFPS())
  love.graphics.print("x: "..math.floor(player.x).." y:"..math.floor(player.y),0,20)
  love.graphics.print("Px: "..math.floor(player.mx).." Py:"..math.floor(player.my),0,40)
  love.graphics.print("Mx: "..math.floor(control.mouse.x).." My:"..math.floor(control.mouse.y),0,60)
  love.graphics.print("aling "..player.angle,0,80)
end

function love.resize(w,h)
  Push:resize(w,h)
end
