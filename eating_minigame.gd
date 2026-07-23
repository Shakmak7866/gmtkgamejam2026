extends CanvasLayer

@export var food_textures : Array[Texture2D] = []

@onready var textRect : TextureRect = $Control/Panel/TextureRect

var click_count = 0
var on_food : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and on_food:
		print("Yummy")

func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and on_food and event.is_pressed():
		click_count += 1
		print(click_count)
		mini_game_play()
		

func _on_area_2d_mouse_entered() -> void:
	on_food = true
	print("on_food")

func _on_area_2d_mouse_exited() -> void:
	on_food = false
	print("off_food")
	
func mini_game_play():
	if click_count < food_textures.size():
		textRect.texture = food_textures[click_count]
		print("Good pizza")
	else:
		print("Finished")
		end_minigame()

func end_minigame():
	# Play animation
	await get_tree().create_timer(2.0).timeout
	queue_free()
