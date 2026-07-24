extends CharacterBody2D

const SPEED = 700.0

func _physics_process(delta: float) -> void:
	var direction := Vector2.LEFT
	velocity.x = direction.x * SPEED
	move_and_slide()
