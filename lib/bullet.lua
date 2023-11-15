bullet = {}

local bullet_sprite = love.graphics.newImage("asset/pic/guns/bullet.png")

function bullet:new(x,y,angle,type,speed)
  blt = {
    x = x,
    y = y,
    speed = speed,
    type = type,
    angle = angle,
    collision = World:newCircleCollider(x,y,2)
  }
  blt.collision:setType("kinematic")
  blt.collision:setCollisionClass("bullet")
  table.insert(self,blt)
end

function bullet:draw()
  for i, blt in ipairs(self) do
    love.graphics.draw(bullet_sprite,blt.x,blt.y,blt.angle,1,1,2,2)
  end
end

function bullet:update(dt)
  for i,blt in ipairs(self) do 
    local dx,dy = blt.speed*math.cos(blt.angle),blt.speed*math.sin(blt.angle)
    blt.collision:setLinearVelocity(dx,dy)
    blt.x,blt.y = blt.collision:getPosition()
  end
end

function bullet:collisions(enamy)
  for i, v in ipairs(self) do
    if rectCollisions(v,enamy) then
      enamy.health = enamy.health - 1
    end
    if v:enter("enemy") then
      local enemy = v:getEnterCollisionData("enemy")
      print(enemy.collider, enemy.contact)
      table.remove(self,i)
    end
  end
end

return bullet
