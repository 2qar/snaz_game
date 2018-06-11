extends Node2D

onready var sprite = $sprite

func _physics_process(delta):
	sprite.set_rotation(global_position.angle_to_point(get_global_mouse_position()) + deg2rad(180))

	if sprite.rotation_degrees < 270 and sprite.rotation_degrees > 90:
		sprite.flip_v = true
	else:
		sprite.flip_v = false