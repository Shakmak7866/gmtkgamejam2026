extends CanvasLayer

@export var dirty_textures : Array[Texture2D] = []
@export var clean_textures : Array[Texture2D] = []

@onready var dirty_dishes : TextureRect = $Control/Panel/DirtyDishes
@onready var clean_dishes : TextureRect = $Control/Panel/CleanDishes

var click_count = 0
var cleaned = 0
var scrubs = 0
var on_food : bool
var scrubbed : bool
var mouse_clicked : bool
var has_dish : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_clicked = true
	else:
		mouse_clicked = false
	
	if scrubs >= 3:
		cleaned += 1
		scrubs = 0
		has_dish = false
	
	if cleaned == 3 and has_dish:
		# Play hand grabbing animation
		end_minigame()

func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton and on_food and event.is_pressed():
		if not has_dish:
			has_dish = true
			#mini_game_play()


func _on_pickup_mouse_entered() -> void:
	pass # Replace with function body.
	on_food = true
	print("on_food")


func _on_pickup_mouse_exited() -> void:
	pass # Replace with function body.
	on_food = false
	print("off_food")


func mini_game_play():
	# Wait for animation to take a dish and move it to center
	# After the animation is done, start scrubbing
	# After 3 scrubs, 
	
	if click_count < clean_textures.size():
		clean_dishes.texture = clean_textures[click_count]
		print("Good pizza")
	else:
		print("Finished")
		end_minigame()

func end_minigame():
	# Play animation
	await get_tree().create_timer(2.0).timeout
	queue_free()


func _on_scrub_mouse_entered() -> void:
	# If you have a dish in hand
	if mouse_clicked and has_dish:
		print("Scrubbing")
		scrubs += 1


func _on_scrub_mouse_exited() -> void:
	scrubbed = false
