local class = require('lib.hump.class')
local keys = require('lib.keys')

local Box = require('ui.box')

local TestScreen = class {}

function TestScreen:init(ScreenManager)
	self.screen = ScreenManager
	self.testBox = Box(20, 25)
end

function TestScreen:activate(testString)
	self.testString = testString
end

function TestScreen:draw()
	love.graphics.print("Test", 10, 10)
	
	if self.testString then
		love.graphics.print(self.testString, 10, 40)
	end
	
	self.testBox:draw(70, 70)
end

function TestScreen:keypressed(key)
	if key == keys.A then
		self.screen:view('/')
	end
end

return TestScreen