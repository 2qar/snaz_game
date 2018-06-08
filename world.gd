extends Node

const SCALE = 5

func _ready():
	OS.set_window_title("if ur reading this, game smells")
	var size = OS.get_window_size()
	print(size)

	var new_width = size.x * SCALE
	var new_height = (new_width / 4) * 3

	var new_size = Vector2(new_width, new_height)
	print(new_size)
	OS.set_window_size(new_size)
	OS.center_window()

	Input.set_custom_mouse_cursor(load("res://test_cursor.png"))