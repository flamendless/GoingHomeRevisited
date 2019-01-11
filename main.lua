--[[
Project: Going Home Revisit
Author: Brandon Blanker Lim-it @flamendless
Start Date: Mon Jan  7 15:28:53 PST 2019
--]]

__DEBUG = true
if __DEBUG then
	io.stdout:setvbuf("no")
end

local Flux = require("modules.flux.flux")
local Timer = require("modules.hump.timer")

local GSM = require("src.gamestate_manager")
local AssetsManager = require("src.assets_manager")
local States = require("states")

function love.load()
	AssetsManager:init()
	-- GSM:initState(States.splash())
	-- GSM:initState(States.menu())
	-- GSM:initState(States.about())
	GSM:initState(States.rain_intro())
end

function love.update(dt)
	Timer.update(dt)
	Flux.update(dt)
	if not AssetsManager:getIsFinished() then
		AssetsManager:update(dt)
	else
		GSM:update(dt)
	end
end

function love.draw()
	if not AssetsManager:getIsFinished() then
		AssetsManager:draw()
	else
		GSM:draw()
		AssetsManager:drawOverlay()
	end
end

function love.keypressed(key)
	GSM:keypressed(key)
end

function love.keyreleased(key)
	GSM:keyreleased(key)
end

function love.mousepressed(mx, my, mb)
	GSM:mousepressed(mx, my, mb)
end

function love.mousereleased(mx, my, mb)
	GSM:mousereleased(mx, my, mb)
end

function love.quit()
end
