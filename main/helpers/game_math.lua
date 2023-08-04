-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.

local M = {}

M.distance = function(point_a, point_b)
	return math.sqrt(math.pow(point_a.x - point_b.x, 2) + math.pow(point_a.y - point_b.y, 2))
end


M.move_to = function(pos, to_pos, speed)

	local distance = M.distance(pos, to_pos)


	local sin = (to_pos.y - pos.y) / distance
	local cos = (to_pos.x - pos.x) / distance
	local new_pos = vmath.vector3()
	
	new_pos.x = pos.x + cos * speed
	new_pos.y = pos.y + sin * speed
    return new_pos
end
return M

