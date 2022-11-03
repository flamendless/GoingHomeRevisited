local Canvas = class({
	name = "CustomCanvas"
})

function Canvas.init_canvases(canvases)
	ASSERT(type(canvases) == "table")
	local game_size = GAME_BASE_SIZE
	local ww, wh = love.graphics.getDimensions()
	local scale = math.min(ww/game_size.x, wh/game_size.y)
	local mid_canvas_prop = {}
	local top_canvas_prop = {}
	local bot_canvas_prop = {}

	mid_canvas_prop.width = game_size.x * scale
	mid_canvas_prop.height = game_size.y * scale
	mid_canvas_prop.x = 0
	mid_canvas_prop.y = math.floor(wh * 0.5 - mid_canvas_prop.height * 0.5)
	mid_canvas_prop.scale = scale

	local rem_height = wh - mid_canvas_prop.height

	top_canvas_prop.width = ww
	top_canvas_prop.height = math.floor(rem_height * 0.5)
	top_canvas_prop.x = 0
	top_canvas_prop.y = 0
	top_canvas_prop.scale = scale

	bot_canvas_prop.width = ww
	bot_canvas_prop.height = math.floor(rem_height * 0.5)
	bot_canvas_prop.x = 0
	bot_canvas_prop.y = math.floor(wh * 0.5 + mid_canvas_prop.height * 0.5)
	bot_canvas_prop.scale = scale

	Canvas.create_main(canvases)
	if canvases.top == nil then
		canvases.top = Canvas(top_canvas_prop)
	else
		canvases.top:set(top_canvas_prop)
	end

	if canvases.mid == nil then
		canvases.mid = Canvas(mid_canvas_prop)
	else
		canvases.mid:set(mid_canvas_prop)
	end

	if canvases.bot == nil then
		canvases.bot = Canvas(bot_canvas_prop)
	else
		canvases.bot:set(bot_canvas_prop)
	end
end

function Canvas.create_main(canvases)
	canvases = canvases or {}
	local ww, wh = love.graphics.getDimensions()
	local main_canvas_prop = {}
	main_canvas_prop.width = ww
	main_canvas_prop.height = wh
	main_canvas_prop.x = 0
	main_canvas_prop.y = 0
	main_canvas_prop.scale = 1
	if canvases.main == nil then
		canvases.main = Canvas(main_canvas_prop)
	else
		canvases.main:set(main_canvas_prop)
	end
	return canvases.main
end

function Canvas:new_default(x, y, width, height, rotation, scale)
	ASSERT(type(x) == "number")
	ASSERT(type(y) == "number")
	ASSERT(type(width) == "number")
	ASSERT(type(height) == "number")
	ASSERT(type(rotation) == "number")
	ASSERT(type(scale) == "number")
	self.canvas = love.graphics.newCanvas(width, height)
	self.canvas:setFilter("nearest", "nearest")
	self.x, self.y = x, y
	self.width, self.height = width, height
	self.rotation = rotation
	self.scale = scale
	return self
end

function Canvas:new_from_table(tbl)
	ASSERT(type(tbl) == "table")
	self.x = tbl.x
	self.y = tbl.y
	self.width = tbl.width
	self.height = tbl.height
	self.rotation = tbl.rotation
	self.scale = tbl.scale or 1
	self.canvas = love.graphics.newCanvas(self.width, self.height)
	self.canvas:setFilter("nearest", "nearest")
	return self
end

function Canvas:new_from_canvas(source)
	ASSERT(source:type() == "CustomCanvas")
	self.canvas = love.graphics.newCanvas(source.width, source.height)
	self.canvas:setFilter("nearest", "nearest")
	self.x, self.y = source.x, source.y
	self.width, self.height = source.width, source.height
	self.rotation = source.rotation
	self.scale = source.scale
	return self
end

function Canvas:new(x, y, width, height, rotation, scale)
	ASSERT(type(x) == "number" or type(x) == "table")
	SASSERT(y, type(y) == "number")
	SASSERT(width, type(width) == "number")
	SASSERT(height, type(height) == "number")
	SASSERT(rotation, type(rotation) == "number")
	SASSERT(scale, type(scale) == "number")
	if type(x) == "table" then
		if x.type and x:type() == "Canvas" then
			self:new_from_canvas(x)
		else
			self:new_from_table(x)
		end
	elseif type(x) == "number" then
		self:new_default(x, y, width, height, rotation, scale)
	end
end

function Canvas:set(x, y, width, height, rotation, scale)
	ASSERT(type(x) == "number")
	ASSERT(type(y) == "number")
	ASSERT(type(width) == "number")
	ASSERT(type(height) == "number")
	SASSERT(rotation, type(rotation) == "number")
	SASSERT(scale, type(scale) == "number")
	local _x, _y, _w, _h, _rotation, _scale

	if type(x) == "number" then
		_x = x
		_y = y
		_w = width
		_h = height
		_rotation = rotation
		_scale = scale or 1
	elseif type(x) == "table" then
		if x.type and x:type() == "Canvas" then
			local c = x
			_x = c.x
			_y = c.y
			_w = c.width
			_h = c.height
			_rotation = c.rotation
			_scale = c.scale
		else
			local tbl = x
			_x = tbl.x
			_y = tbl.y
			_w = tbl.width
			_h = tbl.height
			_rotation = tbl.rotation
			_scale = tbl.scale or 1
		end
	end

	self.width = _w
	self.height = _h
	self.x = _x
	self.y = _y
	self.rotation = _rotation
	self.scale = _scale
end

function Canvas:attach()
	love.graphics.setCanvas(self.canvas)
	love.graphics.clear()
	love.graphics.setBlendMode("alpha")
	love.graphics.setColor(1, 1, 1, 1)
end

function Canvas:detach()
	love.graphics.setCanvas()
end

function Canvas:override_draw(fn)
	self:attach()
	fn()
	self:detach()
end

function Canvas:render()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setBlendMode("alpha", "premultiplied")
	love.graphics.draw(self.canvas, self.x, self.y, self.rotation, self.scale, self.scale)
	love.graphics.setBlendMode("alpha")
end

function Canvas:render_n()
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setBlendMode("alpha", "premultiplied")
	love.graphics.draw(self.canvas)
	love.graphics.setBlendMode("alpha")
end

return Canvas
