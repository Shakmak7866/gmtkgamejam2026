extends Node2D

@onready var player : CharacterBody2D = $CharacterBody2D

var brushed_teeth : bool
var bath_scene : bool
var brush_range : bool
var brushing : bool
var bath_range : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if brushing:
		player.set_physics_process(false)
	else:
		player.set_physics_process(true)

	if Input.is_action_just_pressed("interact") and brush_range:
		brushing = true
		start_minigame()
	
	if Input.is_action_just_pressed("interact") and brushed_teeth and bath_range:
		bath_scene = true
		# TODO animate bath scene

func start_minigame():
	var teeth_minigame = preload("res://teeth_minigame.tscn").instantiate()
	get_tree().current_scene.add_child(teeth_minigame)
	
	teeth_minigame.tree_exited.connect(_on_minigame_finished)

func _on_minigame_finished():
	brushed_teeth = true
	brushing = false
	print("All done")

func _on_door_body_entered(body: Node2D) -> void:
	if bath_scene:
		get_tree().change_scene_to_file("res://rooms/hallwayNormal.tscn")

func _on_toothbrush_body_entered(body: Node2D) -> void:
	brush_range = true

func _on_toothbrush_body_exited(body: Node2D) -> void:
	brush_range = false

func _on_bath_body_entered(body: Node2D) -> void:
	bath_range = true

func _on_bath_body_exited(body: Node2D) -> void:
	bath_range = false
