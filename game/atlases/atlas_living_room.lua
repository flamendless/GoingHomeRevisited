-- https://github.com/EngineerSmith/Export-TextureAtlas
-- check build.sh create_atlas
local Data = {
	frames = {
		["fireplace"] = {
			x = 4,
			y = 4,
			w = 66,
			h = 107
		},
		["table2"] = {
			x = 4,
			y = 174,
			w = 56,
			h = 48
		},
		["door"] = {
			x = 68,
			y = 174,
			w = 38,
			h = 70
		},
		["painting"] = {
			x = 4,
			y = 119,
			w = 71,
			h = 47
		},
		["table"] = {
			x = 111,
			y = 252,
			w = 87,
			h = 11
		},
		["light"] = {
			x = 114,
			y = 4,
			w = 17,
			h = 23
		},
		["plant"] = {
			x = 83,
			y = 78,
			w = 16,
			h = 29
		},
		["stool"] = {
			x = 83,
			y = 115,
			w = 22,
			h = 16
		},
		["chair"] = {
			x = 68,
			y = 252,
			w = 35,
			h = 31
		},
		["fireplace_inner"] = {
			x = 4,
			y = 230,
			w = 34,
			h = 33
		},
		["clock"] = {
			x = 83,
			y = 4,
			w = 23,
			h = 66
		}
	},
	meta = {
		padding = 4,
		extrude = 0,
		atlasWidth = 202,
		atlasHeight = 287,
		quadCount = 11
	}
}
return Data
