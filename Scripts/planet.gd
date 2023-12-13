extends RigidBody2D

var type = Globals.BODY_TYPE_PLANET
@export var has_asteroid_belt = false
var asteroids = []
var sprite
var gravity_area : Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if(has_asteroid_belt):
		initialize_asteroids(500)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	if(sprite == null):
#		sprite = get_node_or_null("../Sprite")
#
#	if(sprite != null):
#		sprite.set_rotation(sprite.rotation + (delta / 20))
#
#		print(sprite.rotation)

	
func get_asteroid_texture():
	# Returns random integer between 1 and 90
	var random_number = randi() % 90 + 1
	return "res://Art/Planets/asteroids" + str(random_number) + ".png"

# Function to initialize asteroid nodes in the belt
func initialize_asteroids(asteroid_count: int) -> void:
	for i in range(asteroid_count):
		var asteroid = Sprite2D.new()
		asteroid.texture = load(get_asteroid_texture())
		asteroid.set_script(load("res://Scripts/asteroid.gd"))
		var scale = randf_range(.05, .2)
		asteroid.apply_scale(Vector2(scale, scale))
		asteroid.position = Vector2(randi_range(0, 50), randi_range(0, 50))
		asteroids.append(asteroid)
		add_child(asteroid)
	
