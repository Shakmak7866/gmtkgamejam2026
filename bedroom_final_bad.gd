extends Node2D

var finish : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $DialogBox.text_queue.is_empty() and not finish:
		finish = true
		$Transition/AnimationPlayer.play("fade_in")
		await $Transition/AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://bad_ending.tscn")
