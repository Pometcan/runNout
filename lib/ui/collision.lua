function circleCollisions(circleA, circleB)
  local dist = (circleA.x - circleB.x)^2 + (circleA.y - circleB.y)^2
  return dist <= (circleA.r + circleB.r)^2
end

function rectCollisions(rectA,rectB)
  return (rectA.y+rectA.h > rectB.y) and (rectA.y < rectB.y + rectB.h) and (rectA.x + rectA.w > rectB.x) and (rectA.x < rectB.x + rectB.w)
end


function circleRectCollisions(circle, rect)
	local circle_distance_x = math.abs(circle.x - rect.x - rect.w/2)
	local circle_distance_y = math.abs(circle.y - rect.y - rect.h/2)

	if circle_distance_x > (rect.w/2 + circle.r) or circle_distance_y > (rect.h/2 + circle.r) then
		return false
	elseif circle_distance_x <= (rect.w/2) or circle_distance_y <= (rect.h/2) then
		return true
	end

	return (math.pow(circle_distance_x - rect.w/2, 2) + math.pow(circle_distance_y - rect.h/2, 2)) <= math.pow(circle.r, 2)
end
