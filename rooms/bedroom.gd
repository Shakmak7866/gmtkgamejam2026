extends Node2D

@onready var transition = $Transition/AnimationPlayer

var checked_list : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("fade_out")
	await transition.animation_finished
	checked_list = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("todo_button"):
		checked_list += 1
	
	if checked_list >= 2:
		get_tree().change_scene_to_file("res://rooms/hallwayEndless.tscn")
