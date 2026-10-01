extends Node3D

@onready var player = $Player
@onready var overlay = $Overlay
@onready var map = Config.map

var start_position = Vector3()
var end_position = Vector3()

func _ready() -> void:
	var path = "res://maps/" + map + "/" + map.capitalize() + ".glb"
	var packed_scene: PackedScene = load(path)
	var scene = packed_scene.instantiate()
	scene.name = "Map"
	add_child(scene)
	start_position = scene.get_node("MAP_START").get_global_position()
	end_position = scene.get_node("MAP_END").get_global_position()
	player.position = start_position
	overlay.start_time = Time.get_ticks_msec()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	var distance_to_end = player.position.distance_to(end_position)
	if distance_to_end < 1.0:
		get_tree().change_scene_to_file("res://scenes/main_menu/MainMenu.tscn")
