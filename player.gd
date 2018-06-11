# TODO: Move the fire function and all of that stuff to the weapon
	# make the muzzle flash a single object that becomes visible and hidden instead of instancing a bunch of muzzle flashes

extends KinematicBody2D

const SPEED = 64

var bullet = preload("res://bullet.tscn")
var flash = preload("res://flash.tscn")
var movement = Vector2()

func _physics_process(delta):
	$mouse_pos.global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("click"):
		fire()
	movement_controller()

func movement_controller():
	# left/right movement
	if Input.is_action_pressed("ui_left"):
		movement.x = -SPEED
	elif Input.is_action_pressed("ui_right"):
		movement.x = SPEED
	else:
		movement.x = 0

	# up/down movement
	if Input.is_action_pressed("ui_up"):
		movement.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		movement.y = SPEED
	else:
		movement.y = 0

	# apply the movement
	movement = move_and_slide(movement, Vector2(0, 0))

func fire():
	# make the bullet
	var fire = bullet.instance()
	get_tree().get_root().add_child(fire)

	# set the rotation
	var angle = get_angle_to(get_global_mouse_position())
	fire.set_rotation(angle + deg2rad(rand_range(-5, 6)))

	# make muzzle flash + set rotation
	var flash = self.flash.instance()
	get_tree().get_root().add_child(flash)
	flash.set_rotation(angle)
	flash.position = $weapon/sprite/bullet_point.global_position

	# move the bullet into place and make it move forwards
	fire.position = $weapon/sprite/bullet_point.global_position
	fire._set_move()