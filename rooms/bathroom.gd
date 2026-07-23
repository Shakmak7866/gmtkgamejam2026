extends Node2D

@onready var brushed_teeth : bool
@onready var bath_scene : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_body_entered(body: Node2D) -> void:
	if bath_scene:
		get_tree().change_scene_to_file("res://rooms/hallwayNormal.tscn")


func _on_toothbrush_body_entered(body: Node2D) -> void:
	brushed_teeth = true


func _on_bath_body_entered(body: Node2D) -> void:
	if brushed_teeth:
		bath_scene = true
		# TODO animate bath scene
