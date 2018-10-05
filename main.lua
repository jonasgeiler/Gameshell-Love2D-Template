--[[ 
-- LOADING SCREEN
-- Uncomment to activate
-- Can be an image for example

love.graphics.clear(255,255,255)
local w, h = love.window.getMode()

> love.graphics.draw(...)
> love.graphics.print(...)
> ...

love.graphics.present()
]]--


-- this fixes compatibility for LÖVE v11.x colors (0-255 instead of 0-1)
require('lib.compatibility')
--

-- Load Libraries
local ScreenManager = require('lib.ScreenManager')
--

-- Load Screens
local MainScreen = require('screens.main')
local TestScreen = require('screens.test')
--


-- Load Game
function love.load()
	local screenManager = ScreenManager()
	
	-- Register your screens here (A screen with the path '/' is mandatory!)
	screenManager:register('/', MainScreen)
	screenManager:register('test/index', TestScreen)
	
	-- Load the main screen. Only needed if you didn't register a screen with path "/"
	--screenManager:view('test/index', 'Wow!')
end
--


