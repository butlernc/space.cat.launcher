extends Sprite2D

var sprite_textures : Array = []  # Array to store sprite textures
var changing_portrait : bool = false  # Flag to track if portrait change is in progress
var original_position : Vector2  # Variable to store the original position


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1, 33):  # Assuming you want filenames from "portraits-spliced1.png" to "portraits-spliced32.png"
		var filename : String = "res://Art/Cat/cat-cam/portraits-spliced" + str(i) + ".png"
		sprite_textures.append(load(filename))
	# Change the initial texture when the node enters the scene
	original_position = Vector2(898, 129)
	change_portrait()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func change_portrait():
	changing_portrait = true
	if sprite_textures.size() > 0:
		var random_index : int = randi() % sprite_textures.size()
		texture = sprite_textures[random_index]
	changing_portrait = false	
	
func _on_cat_launched():
	change_portrait()
		
