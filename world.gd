extends Node

const SCALE = 3

onready var tile_size = $tilemap.get_cell_size()

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

	print(get_viewport().get_camera())

	create_navmesh()

	#Input.set_custom_mouse_cursor(load("res://test_cursor.png"))
	
func create_navmesh():
	var nav_poly = $Navigation2D/NavigationPolygonInstance.get_navigation_polygon()
	var tilemap = $tilemap
	print("Tiles: ", tilemap.get_used_cells().size())
	
	var new_nav = []
	for cell in tilemap.get_used_cells():
		var poly = tilemap.map_to_world(cell)
		print(poly)
		new_nav.append(get_poly(poly))
		
	$Navigation2D/NavigationPolygonInstance.get_navigation_polygon().set_vertices(PoolVector2Array(new_nav))
	
	print("done")
		
func get_poly(tilepos):
	var poly = PoolVector2Array()
	poly.append(tilepos)
	poly.append(Vector2(tilepos.x + tile_size.x, tilepos.y))
	poly.append(Vector2(tilepos.x, tilepos.y + tile_size.y))
	poly.append(Vector2(tilepos.x + tile_size.x, tilepos.y + tile_size.y))
	return poly