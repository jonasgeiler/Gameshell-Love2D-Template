local class = require('lib.hump.class')

local MainScreen = class {}

function MainScreen:init(ScreenManager)
	self.screen = ScreenManager
end

function MainScreen:activate()
end

function MainScreen:draw()
	love.graphics.print("Main", 10, 10)
end

function MainScreen:keypressed(key)
	if key == 'space' then
		self.screen:view('test/index', 'Hello World!')
	end
end

return MainScreen