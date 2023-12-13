extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	initialize_asteroids(3000)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_asteroid_texture():
	# Returns random integer between 1 and 90
	var random_number = randi() % 90 + 1
	return "res://Art/Planets/asteroids" + str(random_number) + ".png"

# Function to initialize asteroid nodes in the belt
func initialize_asteroids(asteroid_count: int) -> void:
	for i in range(asteroid_count):
		var asteroid = Sprite2D.new()
		asteroid.texture = load(get_asteroid_texture())
		asteroid.set_script(load("res://Scripts/boundary_asteroid.gd"))
		var scale = randf_range(.2, .5)
		asteroid.apply_scale(Vector2(scale, scale))
		asteroid.position = Vector2(randi_range(0, 50), randi_range(0, 50))
		add_child(asteroid)
