require("boot")

function love.conf(t)
	t.modules.audio = true
	t.modules.data = true
	t.modules.event = true
	t.modules.font = true
	t.modules.graphics = true
	t.modules.image = true
	t.modules.joystick = false
	t.modules.keyboard = true
	t.modules.math = true
	t.modules.mouse = true
	t.modules.physics = false
	t.modules.sound = true
	t.modules.system = true
	t.modules.thread = true
	t.modules.timer = true
	t.modules.touch = false
	t.modules.video = false
	t.modules.window = true

	t.window.title = "Going Home: Revisited"
	t.window.width = WINDOW_WIDTH
	t.window.height = WINDOW_HEIGHT
	t.window.resizable = false
	t.window.icon = "res/icon.png"

	t.identity = "goinghomerevisited"
	t.version = "11.4"

	if DEV then
		t.console = true
	end
end
