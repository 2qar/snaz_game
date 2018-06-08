extends KinematicBody2D

const SPEED = 64

var movement = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		movement.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		movement.x = SPEED
	else:
		movement.x = 0

	set_rotation(global_position.angle_to_point(get_global_mouse_position()) + deg2rad(180))
	print(rotation)

	movement = move_and_slide(movement, Vector2())