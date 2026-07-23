extends Node2D

var dishes_washed : bool
var cleaning : bool
var cleaning_range : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cleaning:
		return

	if Input.is_action_just_pressed("interact") and cleaning_range:
		#eatingminigame
		start_minigame()


func _on_dishes_body_entered(body: Node2D) -> void:
	# Implement dishes minigame
	cleaning_range = true

func _on_dishes_body_exited(body: Node2D) -> void:
	cleaning_range = false

func _on_door_body_entered(body: Node2D) -> void:
	if dishes_washed:
		get_tree().change_scene_to_file("res://rooms/livingRoom.tscn")

func start_minigame():
	var dishes_minigame = preload("res://dishes_minigame.tscn").instantiate()
	get_tree().current_scene.add_child(dishes_minigame)
	
	dishes_minigame.tree_exited.connect(_on_minigame_finished)

func _on_minigame_finished():
	dishes_washed = true
	print("All done")
