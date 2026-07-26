extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$hand.visible = false
	$AnimationPlayer.play("Final")
	await $AnimationPlayer.animation_finished
	$hand.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $DialogBox.text_queue.size() < 2:
		$AnimationPlayer.play("RESET")
		$DialogBox2.visible = true
