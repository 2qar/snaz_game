extends KinematicBody2D

var health = 100
onready var root = get_tree().get_root()

var flash = preload("res://flash.tscn")
onready var player = get_node("../player")

var path

func _physics_process(delta):
	path = get_node("../Navigation2D").get_simple_path(position, player.position)

	if path.size() >= 2:
		move_and_slide((path[1] - global_position).normalized() * 32)
	

func take_damage(damage):
	var result = health - damage

	if result <= 0:
		die()
	else:
		health -= damage

	print(health)

func die():
	queue_free()
