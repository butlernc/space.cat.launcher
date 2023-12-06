extends RigidBody2D

var type = Globals.BODY_TYPE_PLANET



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Function to initialize asteroid nodes in the belt
func initialize_asteroids(asteroid_count: int) -> void:
	for i in range(asteroid_count):
		pass
		# var asteroid = Asteroid.new()
		# asteroid.position = Vector2(rand_range(-200, 200), rand_range(-200, 200))
		# asteroids.append(asteroid)
		# add_child(asteroid)
