extends CanvasLayer

@onready var dirty_sprite: Sprite2D =$DirtyTeeth

var image: Image
var texture: ImageTexture

const BRUSH_RADIUS = 64

func _ready():
	image = dirty_sprite.texture.get_image()
	texture = ImageTexture.create_from_image(image)
	dirty_sprite.texture = texture

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var pos = get_viewport().get_mouse_position()
		pos = dirty_sprite.to_local(pos)
		pos = pos + (Vector2(image.get_width(), image.get_height())/2.0)
		erase_circle(pos)
	else:
		if percent_clean() > 0.9:
			print("Teeth Cleaned")
			await get_tree().create_timer(2.0).timeout
			queue_free()

func erase_circle(center: Vector2):
	for x in range(center.x - BRUSH_RADIUS, center.x + BRUSH_RADIUS):
		for y in range(center.y - BRUSH_RADIUS, center.y + BRUSH_RADIUS):

			if x < 0 or y < 0:
				continue
			if x >= image.get_width() or y >= image.get_height():
				continue

			if Vector2(x, y).distance_to(center) <= BRUSH_RADIUS:
				image.set_pixel(x, y, Color("ffffff00"))

	texture.update(image)


func percent_clean() -> float:
	var transparent := 0
	var total := image.get_width() * image.get_height()
	
	for x in image.get_width():
		for y in image.get_height():
			if image.get_pixel(x, y).a == 0:
				transparent += 1
				
	return float(transparent) / total
