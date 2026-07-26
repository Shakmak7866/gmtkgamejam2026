extends Node2D

@onready var transition = $Transition/AnimationPlayer

var desk_range : bool
var desk_interact : bool
var trash_cleaned : bool
var no_creep : bool
@export var trash : Array[Trash]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	no_creep = true
	transition.play("fade_out")
	await transition.animation_finished
	for t in trash:
		t.cleaned.connect(_on_trash_cleaned)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = Global.text
	
	if trash_cleaned and no_creep:
		no_creep = false
		var creep = preload("res://creep.tscn").instantiate()
		get_tree().current_scene.add_child(creep)
	
		creep.tree_exited.connect(_on_creep_finished)
	
	if Input.is_action_just_pressed("interact") and desk_range and trash_cleaned:
		desk_scene()
		# Actually execute pickup image scene

func _on_creep_finished():
	$Photofall.visible = true

func desk_scene():
	var pic = preload("res://PicScene.tscn").instantiate()
	get_tree().current_scene.add_child(pic)
	
	pic.tree_exited.connect(_on_pic_finished)
	

func _on_pic_finished():
	desk_interact = true
	$Photofall.visible = false

func _on_trash_cleaned(t : Trash):
	trash.erase(t)
	
	if trash.is_empty():
		trash_cleaned = true
		print("Trash Cleaned")

func _on_door_body_entered(body: Node2D) -> void:
	if desk_interact:
		transition.play("fade_in")
		await transition.animation_finished
		get_tree().change_scene_to_file("res://rooms/hallwayNormal.tscn")


func _on_desk_body_entered(body: Node2D) -> void:
	print("in")
	desk_range = true


func _on_desk_body_exited(body: Node2D) -> void:
	desk_range = false
