extends Node2D

@onready var dinner_eaten : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_dinner_body_entered(body: Node2D) -> void:
	# Should be eaten by "E"
	dinner_eaten = true


func _on_door_body_entered(body: Node2D) -> void:
	if dinner_eaten:
		get_tree().change_scene_to_file("res://rooms/kitchen.tscn")
