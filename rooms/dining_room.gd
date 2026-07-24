extends Node2D

var dinner_range : bool
var dinner_eaten : bool
var eating : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if eating:
		return

	if Input.is_action_just_pressed("interact") and dinner_range:
		eating = true
		start_minigame()


func _on_door_body_entered(body: Node2D) -> void:
	if dinner_eaten:
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
