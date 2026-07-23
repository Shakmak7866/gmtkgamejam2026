extends Node2D

@onready var dishes_washed : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dishes_body_entered(body: Node2D) -> void:
	# Implement dishes minigame
	dishes_washed = true


func _on_door_body_entered(body: Node2D) -> void:
	if dishes_washed:
		get_tree().change_scene_to_file("res://rooms/livingRoom.tscn")
