extends Node2D

func _ready() -> void:
	$CanvasLayer/Tutorial/TextureButton.pressed.connect(_on_map_card_pressed)

func _on_map_card_pressed() -> void:
	Config.map = "Tutorial"
	get_tree().change_scene_to_file("res://scenes/world/World.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
