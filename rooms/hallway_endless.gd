extends Node2D

var SPEED = 700.0

@onready var darkness : Area2D = $Darkness
@onready var player : CharacterBody2D = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	darkness.position.x -= SPEED * delta


func _on_darkness_body_entered(body: Node2D) -> void:
	print("You died")
	SPEED = 0
	player.set_physics_process(false)
	# Go to Death Screen


func _on_finish_line_body_entered(body: Node2D) -> void:
	SPEED = 0
	print("You Survived")
	await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file("res://rooms/bedroom_final.tscn")
