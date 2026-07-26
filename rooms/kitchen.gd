extends Node2D

@onready var player : CharacterBody2D = $CharacterBody2D
@onready var transition = $Transition/AnimationPlayer

var dishes_washed : bool
var cleaning : bool
var cleaning_range : bool

func _ready() -> void:
	transition.play("fade_out")
	await transition.animation_finished


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.text
	if cleaning:
		player.set_physics_process(false)
	else:
		player.set_physics_process(true)

	if Input.is_action_just_pressed("interact") and cleaning_range:
		cleaning = true
		start_minigame()


func _on_dishes_body_entered(body: Node2D) -> void:
	# Implement dishes minigame
	cleaning_range = true

func _on_dishes_body_exited(body: Node2D) -> void:
	cleaning_range = false

func _on_door_body_entered(body: Node2D) -> void:
	if dishes_washed:
		transition.play("fade_in")
		await transition.animation_finished
		get_tree().change_scene_to_file("res://rooms/livingRoom.tscn")

func start_minigame():
	var dishes_minigame = preload("res://dishes_minigame.tscn").instantiate()
	get_tree().current_scene.add_child(dishes_minigame)
	
	dishes_minigame.tree_exited.connect(_on_minigame_finished)

func _on_minigame_finished():
	dishes_washed = true
	cleaning = false
	print("All done")
