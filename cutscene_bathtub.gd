extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("bathtub")
	await $AnimationPlayer.animation_finished
	await get_tree().create_timer(2).timeout
	$AnimationPlayer.play_backwards("bathtub")
	await $AnimationPlayer.animation_finished
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
