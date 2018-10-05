local class = require('lib.hump.class')

local Box = class {}

function Box:init(width, height)
	self.width = width
	self.height = height
end

function Box:draw(x,y)
	love.graphics.rectangle('line', x,y, self.width,self.height)
end

return Box