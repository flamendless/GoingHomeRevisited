local function ctor_single(c, signal, delay, ...)
	ASSERT(type(signal) == "string")
	SASSERT(delay, type(delay) == "number")
	c.signal = signal
	c.delay = delay or 0
	c.args = {...}
end

local function ctor_multi(c, ...)
	c.values = {...}
	if DEV then
		for _, v in ipairs(c.values) do
			ASSERT(type(v.signal) == "string")
			SASSERT(v.delay, type(v.delay) == "number")
		end
	end
end

local function callback(name, ctor)
	return Concord.component(name, ctor)
end

local names = {
	"animation_on_loop",
	"animation_on_update",
	"animation_on_finish",
	"lerp_on_finish",
	"typewriter_on_finish",
	"on_enter_menu",
	"color_fade_out_finish",
	"color_fade_in_finish",
	"on_dialogue_end",
	"on_blink_end",
	"on_d_light_flicker_during",
	"on_d_light_flicker_after",
	"on_path_update",
	"on_path_reached_end",
}

local names_multi = {
	"lerp_on_finish_multi"
}

for _, v in ipairs(names) do
	callback(v, ctor_single)
end

for _, v in ipairs(names_multi) do
	callback(v, ctor_multi)
end
