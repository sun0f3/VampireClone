-- Put functions in this file to use them in several other scripts.
-- To get access to the functions, you need to put:
-- require "my_directory.my_file"
-- in any script using the functions.


local enemies = {}

local M = {}

M.add = function(enemy_id)
    print('add')
	print(enemy_id)
	
	table.insert(enemies, enemy_id)
end

M.present = function()
  return M.length() > 0
end
M.length = function()
	return table.getn(enemies)
end

M.first = function()
	return enemies[1]
end

M.nearest = function(pos)
	return enemies[math.random(1, M.length())]
end

M.indexOf = function(value)
	for i, v in ipairs(enemies) do
		if v == value then
			return i
		end
	end
	return nil
end

M.remove = function(enemy_id)
	local pos = M.indexOf(enemy_id)
	print('remove')
	print(enemy_id)
	print(pos)
	table.remove(enemies, pos)
end

return M