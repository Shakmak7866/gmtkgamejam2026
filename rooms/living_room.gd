extends Node2D

var desk_range : bool
var desk_interact : bool
var trash_cleaned : bool
@export var trash : Array[Trash]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for t in trash:
		t.cleaned.connect(_on_trash_cleaned)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and desk_range and trash_cleaned:
		desk_interact = true
		# Actually execute pickup image scene

func _on_trash_cleaned(t : Trash):
	trash.erase(t)
	
	if trash.is_empty():
		trash_cleaned = true
		print("Trash Cleaned")

func _on_door_body_entered(body: Node2D) -> void:
	if desk_interact:
		get_tree().change_scene_to_file("res://rooms/hallwayNormal.tscn")


func _on_desk_body_entered(body: Node2D) -> void:
	desk_range = true


func _on_desk_body_exited(body: Node2D) -> void:
	desk_range = false
