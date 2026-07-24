extends Node2D

@onready var player : CharacterBody2D = $CharacterBody2D
@onready var transition = $Transition/AnimationPlayer

var dinner_range : bool
var dinner_eaten : bool
var eating : bool

func _ready() -> void:
	transition.play("fade_out")
	await transition.animation_finished


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if eating:
		player.set_physics_process(false)
	else:
		player.set_physics_process(true)

	if Input.is_action_just_pressed("interact") and dinner_range:
		eating = true
		start_minigame()


func _on_door_body_entered(body: Node2D) -> void:
	if dinner_eaten:
		transition.play("fade_in")
		await transition.animation_finished
		get_tree().change_scene_to_file("res://rooms/kitchen.tscn")

func _on_dinner_body_entered(body: Node2D) -> void:
	dinner_range = true

func _on_dinner_body_exited(body: Node2D) -> void:
	dinner_range = false

func start_minigame():
	var eating_minigame = preload("res://eating_minigame.tscn").instantiate()
	get_tree().current_scene.add_child(eating_minigame)
	
	
	eating_minigame.tree_exited.connect(_on_minigame_finished)

func _on_minigame_finished():
	eating = false
	dinner_eaten = true
	print("Im Full")
