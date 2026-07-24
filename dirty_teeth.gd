extends Sprite2D


var brush_radius = 24

func _input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		draw_circle_at(event.position)

func draw_circle_at(pos):
	var mark = Sprite2D.new()
	#mark.texture = brush_texture
	mark.position = pos
	add_child(mark)
