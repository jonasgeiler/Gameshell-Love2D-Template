local class = require('lib.hump.class')

local ScreenManager = class {}

function ScreenManager:init()
	self.routes = {}
	self.currentScreen = nil
	self.currentPath = ''
	
	self:registerEvents()
end

function ScreenManager:event(event, arguments)
	if arguments == nil then
		arguments = {}
	elseif type(arguments) ~= 'table' then
		arguments = {arguments}
	end
	
	if self.activeScreen and self.activeScreen[event] then
		self.activeScreen[event](--[[self=]] self.activeScreen, unpack(arguments))
	end
end

function ScreenManager:register(path, screenClass)
	local newRoute = {
		path = path,
		instance = screenClass(self)
	}
	
	if path == '/' then -- if screen is the root path then register it by default
		newRoute.instance:activate()
		self.activeScreen = newRoute.instance
		self.currentPath = '/'
	end
	
	return table.insert(self.routes, newRoute)
end

function ScreenManager:view(path, ...)
	for _, route in pairs(self.routes) do
		if path == route.path then
			route.instance:activate(...)
			self.activeScreen = route.instance
			self.currentPath = path
		end
	end
end

-- Register Löve2D events
function ScreenManager:registerEvents()
	local _self = self
	
	-- Only the ones that could be used on a gameshell are not commented out!
	-- The events that are commented out with four '-', cause trouble when not being used
	
	--function love.directorydropped(...) _self:event('directorydropped', ...) end
	function love.draw(...) _self:event('draw', ...) end
	----function love.errhand(...) _self:event('errhand', ...) end
	----function love.errorhandler(...) _self:event('errorhandler', ...) end
	--function love.filedropped(...) _self:event('filedropped', ...) end
	function love.focus(...) _self:event('focus', ...) end
	function love.keypressed(...)
		if select(1, ...) == 'escape' then
			love.event.quit()
		end
		_self:event('keypressed', ...)
	end
	function love.keyreleased(...) _self:event('keyreleased', ...) end
	function love.lowmemory(...) _self:event('lowmemory', ...) end
	--function love.mousefocus(...) _self:event('mousefocus', ...) end
	--function love.mousemoved(...) _self:event('mousemoved', ...) end
	--function love.mousepressed(...) _self:event('mousepressed', ...) end
	--function love.mousereleased(...) _self:event('mousereleased', ...) end
	function love.quit(...) _self:event('quit', ...) end
	function love.resize(...) _self:event('resize', ...) end
	----function love.run(...) _self:event('run', ...) end
	function love.textedited(...) _self:event('textedited', ...) end
	function love.textinput(...) _self:event('textinput', ...) end
	function love.threaderror(...) _self:event('threaderror', ...) end
	--function love.touchmoved(...) _self:event('touchmoved', ...) end
	--function love.touchpressed(...) _self:event('touchpressed', ...) end
	--function love.touchreleased(...) _self:event('touchreleased', ...) end
	function love.update(...) _self:event('update', ...) end
	function love.visible(...) _self:event('visible', ...) end
	--function love.wheelmoved(...) _self:event('wheelmoved', ...) end
end

return ScreenManager