extends Node

var GUNNER_UI_ON = true
var BODY_TYPE_PLANET = "BODY_TYPE_PLANET"
var BODY_TYPE_TACO = "BODY_TYPE_TACO"
var BODY_TYPE_CAT = "BODY_TYPE_CAT"

var ASTEROID_SIZE_SMALL = 0.1
var ASTEROID_SIZE_MEDIUM = 0.2
var ASTEROID_SIZE_LARGE = 0.3
var SCORE_LIMIT = 10

func change_to_main_scene():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func change_to_menu_scene():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func exit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().exit()
	


# The task is to take a parameter of planets count
# and generate the entire level off of that. If we need
# more items, I'll add them here later.

# We'll need helper functions that get random textures.
func get_asteroid_texture():
	# Returns random integer between 1 and 90
	var random_number = randi() % 90 + 1
	var file_path = "res://Art/Planets/asteroids" + str(random_number) + ".png"
	return load(file_path)


# first we need to think about generating one planet. Since we want the generator to create the
# planet the way it sees fit we will first write a prototype method that generates a very specific
# planet (with an asteroid belt because that's a badass idea)

# we'll have a helper func that generates an asteroid, this method will take the desired ratio of
# ASTEROID_SIZE_SMALL, ASTEROID_SIZE_MEDIUM, ASTEROID_SIZE_LARGE
func generate_asteroid(size):
	# TODO: generate json instead of node
	var sprite = Sprite2D.new()
	sprite.set_texture(get_asteroid_texture())
	sprite.transform.set_scale(size)
	
# once in prod, we'll coin flip 5 times and if it get's head 3 times it gets an asteroid belt
func generate_asteroid_belt_check():
	pass


func generate_planet():
	# var ab_check = generate_asteroid_belt_check()
	pass
	
# second we'll make two more methods that do the same but generate moons and standalone asteroids
