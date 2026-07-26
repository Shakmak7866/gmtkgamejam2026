extends Node

var timer : float = 300
var game_start : bool
var in_bed : bool
var text : String
var chores_done : bool


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_start and not in_bed:
		timer -= delta
		var minutes: int = int(timer) / 60
		var seconds: int = int(timer) % 60
		text = "%02d:%02d" % [minutes, seconds]
		#print(text)
	else:
		text = ""
	
	if int(timer) == 0:
		game_start = false
		if not in_bed:
			get_tree().change_scene_to_file("res://bedroom_final_bad.tscn")
