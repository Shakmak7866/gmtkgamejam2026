extends Control

@onready var transition = $Transition/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	transition.play("fade_in")
	await transition.animation_finished
	get_tree().change_scene_to_file("res://rooms/hallway.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
