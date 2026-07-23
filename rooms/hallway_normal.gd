extends Node2D

@onready var bathroom_done : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bathroom_done = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bathroom_door_body_entered(body: Node2D) -> void:
	#if not bathroom_done: # Might need a global variable
		#bathroom_done = true
	get_tree().change_scene_to_file("res://rooms/bathroom.tscn")	


func _on_bedroom_door_body_entered(body: Node2D) -> void:
	if bathroom_done:
		get_tree().change_scene_to_file("res://rooms/bedroom.tscn")
