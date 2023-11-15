enemy = {}


zombieSprite=sprite:create({img = "asset/pic/Characters/Zombie.png",
w = 16,h=17,row = 4,col =10,name = "zombie_sprite"})

function enemy:new(x,y,type,health)
  enem = {
    x = x,
    y = y,
    w = 16,
    h = 17,
    type = type,
    health = health,
    sprite = zombieSprite,
    collision = World:newCircleCollider(x,y,6)
  }
  enem.collision:setType("kinematic")
  enem.collision:setCollisionClass("enemy")
  table.insert(self,enem)
end

function enemy:draw()
  for i, v in ipairs(self) do
    love.graphics.draw(zombieSprite.img,zombieSprite[1][1],v.x,v.y,0,1,1,9,9)
  end
end

function enemy:update(dt)
  for i, v in ipairs(self) do
    v.x, v.y = v.collision:getPosition()
    if v.health <= 0 then
      table.remove(self,v)
    end
  end
end
