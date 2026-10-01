extends Node2D

var start_time = 0
@onready var timer = $CanvasLayer/Timer

func format_ms(ms: int) -> String:
	var minutes := ms / 60000
	var seconds := (ms % 60000) / 1000
	var milliseconds := ms % 1000
	return "%02d:%02d:%03d" % [minutes, seconds, milliseconds]
	
func _process(delta: float) -> void:
	var time = Time.get_ticks_msec()
	var ms = time - start_time
	timer.text = format_ms(ms)
