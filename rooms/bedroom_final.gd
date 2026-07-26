extends Node2D


var checked_list : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(1).timeout
	$DialogBox.visible = true
	checked_list = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("todo_button"):
		checked_list += 1
	
	if $DialogBox.text_queue.is_empty() and checked_list == 2:
		checked_list = 3
		$AnimationPlayer.play("hide")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://final_scene.tscn")
