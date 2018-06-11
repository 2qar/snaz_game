extends KinematicBody2D

var movement

var speed = 3

func _physics_process(delta):
	var collide
	if movement != null:
		collide = move_and_collide(movement)

	if collide != null:
		queue_free()

func _set_move():
	movement = ($forward.global_position - global_position).normalized() * speed