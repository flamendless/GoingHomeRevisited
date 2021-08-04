local data = {
	frames = {
		car = {
			frame = {
				x = 4,
				y = 4,
				w = 126,
				h = 48
			},
			rotated = false,
			trimmed = false,
			spriteSourceSize = {
				x = 0,
				y = 0,
				w = 126,
				h = 48
			},
			sourceSize = {
				w = 126,
				h = 48
			},
			pivot = {
				x = 0.5,
				y = 0.5
			}
		},
		backdoor = {
			frame = {
				x = 138,
				y = 4,
				w = 10,
				h = 67
			},
			rotated = false,
			trimmed = false,
			spriteSourceSize = {
				x = 0,
				y = 0,
				w = 10,
				h = 67
			},
			sourceSize = {
				w = 10,
				h = 67
			},
			pivot = {
				x = 0.5,
				y = 0.5
			}
		},
		frontdoor = {
			frame = {
				x = 156,
				y = 4,
				w = 33,
				h = 67
			},
			rotated = false,
			trimmed = false,
			spriteSourceSize = {
				x = 0,
				y = 0,
				w = 33,
				h = 67
			},
			sourceSize = {
				w = 33,
				h = 67
			},
			pivot = {
				x = 0.5,
				y = 0.5
			}
		}
	},
	meta = {
		app = "http://free-tex-packer.com",
		version = "0.6.7",
		image = "atlas_outside_items.png",
		format = "RGBA8888",
		size = {
			w = 256,
			h = 128
		},
		scale = 1
	}
}

local list = {
	{
		id = "car",
		x = 729, y = 273, z = 4,
		dialogue = {"outside", "car"},
		usable_with_item = true,
		not_interactive = true,
	},
	{
		id = "backdoor",
		x = 433, y = 254, z = 4,
		dialogue = {"outside", "backdoor"},
	},
	{
		id = "frontdoor",
		x = 299, y = 221, z = 4,
		dialogue = {"outside", "frontdoor_locked"},
		usable_with_item = true,
	},
}

return {data, list}
