extends Node2D

@onready var desk_interact : bool
@onready var trash_cleaned : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	trash_cleaned = true
	# TODO Implement clean trash minigame


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_body_entered(body: Node2D) -> void:
	if desk_interact:
		get_tree().change_scene_to_file("res://rooms/hallwayNormal.tscn")


func _on_desk_body_entered(body: Node2D) -> void:
	if trash_cleaned:
		desk_interact = true
