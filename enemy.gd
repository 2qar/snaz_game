extends KinematicBody2D

var health = 100

var flash = preload("res://flash.tscn")
onready var player = get_node("../player")

func _physics_process(delta):
	var path = get_node("../Navigation2D").get_simple_path(position, player.position)
	print(path.size())
	for point in path:
		print(point)
		var flasho = flash.instance()
		get_tree().get_root().add_child(flasho)

		flasho.position = point

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