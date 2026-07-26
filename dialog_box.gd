extends CanvasLayer

const read_rate = 0.05

@onready var box = $Box
@onready var start_symbol = $Box/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $Box/MarginContainer/HBoxContainer/End
@onready var label = $Box/MarginContainer/HBoxContainer/Label

enum State {
	READY,
	READING,
	DONE
}

var current_state = State.READY
@export var text_queue : Array[String]
var tween : Tween = null


func _ready() -> void:
	hide_box()

func _process(delta):
	if visible:
		match current_state:
			State.READY:
				if !text_queue.is_empty():
					show_text()
			State.READING:
				if Input.is_action_just_pressed("ui_accept"):
					if tween and tween.is_valid():
						tween.kill()
						tween = null
					label.visible_ratio = 1.0
					end_symbol.text = "*"
					change_state(State.DONE)
			State.DONE:
				label.visible_ratio = 1.0
				if Input.is_action_just_pressed("ui_accept"):
					change_state(State.READY)
					hide_box()

func hide_box():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	box.hide()
	
func show_box():
	start_symbol.text = "*"
	box.show()

func show_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_ratio = 0.0
	change_state(State.READING)
	show_box()
	
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * read_rate)
	tween.finished.connect(on_tween_finished)
	

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.DONE:
			print("Changing state to: State.FINISHED")

func on_tween_finished():
	end_symbol.text = "*"
	label.visible_ratio = 1.0
	change_state(State.DONE)
