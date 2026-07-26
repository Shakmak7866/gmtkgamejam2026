extends Node2D

var SPEED = 745.0

@onready var darkness : Area2D = $Darkness
@onready var player : CharacterBody2D = $CharacterBody2D
@onready var transition = $Transition/AnimationPlayer

var timer = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= (delta*130)
	print(int(timer))
	$CharacterBody2D/Label.text = "%d" % [timer]
	darkness.position.x -= SPEED * delta
	$Darkness/AnimationPlayer.play("moving")


func _on_darkness_body_entered(body: Node2D) -> void:
	player.set_physics_process(false)
	transition.play("fade_in")
	await transition.animation_finished
	get_tree().change_scene_to_file("res://rooms/bedroom.tscn")


func _on_finish_line_body_entered(body: Node2D) -> void:
	SPEED = 0
	print("You Survived")
	await get_tree().create_timer(.5).timeout
	get_tree().change_scene_to_file("res://rooms/bedroom_final.tscn")
