if love._version_major >= 11 then 
	local _setColor = love.graphics.setColor
	
	love.graphics.setColor = function (r, g, b, a)
		_setColor(r / 255, g / 255, b / 255, (a or 255) / 255)
	end
end