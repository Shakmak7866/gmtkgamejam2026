class_name Trash
extends Area2D

@export var trash_texture : Texture2D

@onready var sprite : Sprite2D = $Sprite2D

var trash_range : bool

signal cleaned(trash)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = trash_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and trash_range:
		clean()

func clean():
	cleaned.emit(self)
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	trash_range = true


func _on_body_exited(body: Node2D) -> void:
	trash_range = false
