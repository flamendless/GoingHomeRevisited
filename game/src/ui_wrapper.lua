if not DEV then return {} end

local UIWrapper = {}

function UIWrapper.edit_number(id, value, is_int)
	local v = value
	if is_int then
		v = math.floor(v)
	end
	Slab.Text(id .. ":")
	Slab.SameLine()
	local bool = Slab.Input(id, {
		Text = tostring(v),
		ReturnOnText = false,
		NumbersOnly = true,
	})
	if bool then
		value = Slab.GetInputNumber()
		if is_int then
			value = math.floor(value)
		end
	end
	return value, bool
end

function UIWrapper.edit_range(id, value, min, max, is_int)
	Slab.Text(id .. ":")
	Slab.SameLine()
	local bool = Slab.InputNumberSlider(id, value, min, max, {
		Precision = not is_int and 2 or 0
	})
	if bool then
		value = Slab.GetInputNumber()
		if is_int then
			value = math.floor(value)
		end
	end
	return value, bool
end

return UIWrapper
