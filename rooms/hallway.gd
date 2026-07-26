extends Node2D

@onready var door : Area2D = $Door
@onready var transition = $Transition/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.play("fade_out")
	await transition.animation_finished
	$DialogBox.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.text
	if $DialogBox.text_queue.is_empty():
		Global.game_start = true


func _on_door_body_entered(body: Node2D) -> void:
	transition.play("fade_in")
	await transition.animation_finished
	get_tree().change_scene_to_file("res://rooms/diningRoom.tscn")
