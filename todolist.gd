extends CanvasLayer

@export var todolist : Array[String]
@onready var label : Label = $Control/TextureRect/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	self.visible = false
	
	var new_font = load("res://assests/Secret Solver.ttf")
	if todolist.size() == 1:
		label.text = todolist[0]
		label.add_theme_color_override("font_color", Color.RED)
		label.add_theme_font_override("font", new_font)
		label.add_theme_font_size_override("font_size", 100)
		label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	else:
		for i in todolist:
			label.text += "\n" + i

func _process(_delta):
	if Input.is_action_just_pressed("todo_button"):
		self.visible = !self.visible


func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
