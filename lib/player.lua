player = {}

local second,ani,ani2 = 0,1,1

function player:load()
  self.x,self.y = ww/2+8,wh/2-8
  self.w,self.h = 16,17
  self.r = 6
  self.vX = 0 self.vY = 0
  self.speed = 60
  self.aspect = 1
  self.bulletSpeed = 100
  self.mx,self.my = camera:toCameraCoords(control.mouse.x,control.mouse.y)
  self.scale = 1
  self.angle = math.atan2((self.my - self.y),(self.mx - self.x))
  self.gun = {
    type = "Shotgun",
    x = self.x + 3,
    y = self.y + 5,
    scale = 1,
    horizon = 1,
    vertical = 1,
    originX = 3,
    originY = 8,
    offset = 15,
   gunFire = {
      sprite = sprite:create({img = "asset/pic/Diksin.png",row = 1,col=4,w = 8, h=8,name = "GunFire"}),
    }
  }
  self.sprite=sprite:create({img = "asset/pic/Characters/Player.png",row=12,col=4,w=16,h=17,name = "player_sprite"})
  self.timer = {
    time = 10,
    sprite = sprite:create({img = "asset/pic/SandClock.png",row = 1,col =10,w=18,h=32,name = "SandClock"})
  }
  self.collider = World:newCircleCollider(self.x,self.y,self.r)
  self.collider:setType('dynamic')
  self.collider:setCollisionClass("player")
end

function player:draw()
  --Silah ve Karakter çizimi
  if self.angle >= -1.5 and self.angle <= 1.5 then
    self.gun.x = self.x+5
    self.gun.y = self.y+3
    self.gun.horizon = 1
    self.gun.originX = 3
    self.gun.originY = 8
  else
    self.gun.x = self.x-5
    self.gun.y = self.y+3
    self.gun.horizon = -1
    self.gun.originX = 3
    self.gun.originY = 8
  end
  if self.angle >= -2.4 and self.angle < 0.7 then
    love.graphics.draw(love.graphics.newImage("asset/pic/guns/"..self.gun.type..".png"),self.gun.x,self.gun.y,self.angle,self.gun.scale,self.gun.horizon,self.gun.originX,self.gun.originY)
    if love.mouse.isDown(1) then
      love.graphics.draw(self.gun.gunFire.sprite.img,self.gun.gunFire.sprite[1][math.floor(ani)],self.gun.x,self.gun.y,self.angle,self.gun.scale,self.gun.horizon,self.gun.originX-14,self.gun.originY-2)
    end
    love.graphics.draw(self.sprite.img,self.sprite[self.aspect][math.floor(ani)],self.x,self.y,self.rotate,1,1,9,9)
  else
    love.graphics.draw(self.sprite.img,self.sprite[self.aspect][math.floor(ani)],self.x,self.y,self.rotate,1,1,9,9)
    love.graphics.draw(love.graphics.newImage("asset/pic/guns/"..self.gun.type..".png"),self.gun.x,self.gun.y,self.angle,self.gun.scale,self.gun.horizon,self.gun.originX,self.gun.originY)
    if love.mouse.isDown(1) then
      love.graphics.draw(self.gun.gunFire.sprite.img,self.gun.gunFire.sprite[1][math.floor(ani)],self.gun.x,self.gun.y,self.angle,self.gun.scale,self.gun.horizon,self.gun.originX-14,self.gun.originY-2)
    end
  end
  --Kumsaatti çizimi
  love.graphics.draw(self.timer.sprite.img,self.timer.sprite[1][self.timer.time],5,5)

  --Kumsaatti sayacı çizimi
  love.graphics.setColor(1,0,0)
  love.graphics.setFont(love.graphics.newFont(8))
  love.graphics.printf(tostring(self.timer.time),4,40,23,"center")
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(love.graphics.newFont("asset/font/west_england.ttf",20))
end

function player:update(dt)
  --Angle Hesaplama
  local mx,my = camera:toWorldCoords(control.mouse.x,control.mouse.y)
  self.mx = mx
  self.my = my
  self.angle = math.atan2((my - self.y),(mx - self.x))

  --Animasyon sürekliliği ve kum saatti
  ani = ani+(dt*(self.speed/10))
  ani2 = ani2+(dt/100)
  if ani > 5 then
    ani = 1
  end
  if ani > 5 then
    ani2 = 1
  end
  second = second + dt
  self.timer.time = self.timer.time - math.floor(second)
  if self.timer.time <= 0 then
   self.timer.time = 10
  end
  if second > 1 then
    second = 0
  end

  --Karakter Hareketi
  if love.keyboard.isDown("w") then
    self.vY = -1
  end
  if love.keyboard.isDown("s") then
    self.vY = 1
  end
  if love.keyboard.isDown("a") then
    self.vX = -1
  end
  if love.keyboard.isDown("d") then
    self.vX = 1
  end
  player.collider:setLinearVelocity(self.vX*self.speed,self.vY*self.speed)
  self.vX = 0 self.vY = 0
  self.x,self.y = player.collider:getPosition()

  --Karakter animasyonları
  if self.angle >= -2.4 and self.angle < -0.7 then
    self.aspect = 7
  elseif self.angle >= -0.7 and self.angle < 0.5 then
    self.aspect = 5
  elseif self.angle >= 0.5 and self.angle < 2.3 then
    self.aspect = 8
  else
    self.aspect = 6
  end
  if (love.keyboard.isDown("w") or  love.keyboard.isDown("a") or  love.keyboard.isDown("s") or  love.keyboard.isDown("d"))  and self.aspect > 4 then
    self.aspect = self.aspect-4
  end
end

function player:keypressed(key)
end

function player:keyreleased(key)
end

function player:mouse(x,y,dx,dy)
end

function player:mousepressed(x,y,btn)
  if btn == 1 then
    local x,y = self.gun.offset*math.cos(self.angle),self.gun.offset*math.sin(self.angle)
    bullet:new(self.x+x,self.y+y,self.angle,self.bullet,self.bulletSpeed)
  elseif btn == 2 then
    enemy:new(x,y,"zombie",4)
  end
end

function player:mousereleased(x,y,btn)
end

return player
