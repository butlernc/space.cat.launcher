extends Object

var level_data: Resource

func generate_new_level():
	level_data = JSON.new()
	var starting_planet = generate_starting_planet()
	var celestial_bodies = generate_celestial_bodies()
	var tacos = generate_tacos(celestial_bodies)
	

func save_to_file(json):
	# Create a dictionary to store the data
	var data = {"file_path": file_path}
	
	# Convert the dictionary to a JSON string
	var json_string = JSON.stringify(data)
	
	# Open a file for writing
	var file = File.new()
	
	# Open or create the JSON file
	file.open("user://data.json", File.WRITE)
	
	# Write the JSON string to the file
	file.store_string(json_string)
	
	# Close the file
	file.close()
	



# The task is to take a parameter of planets count
# and generate the entire level off of that. If we need
# more items, I'll add them here later.

# We'll need helper functions that get random textures.
func get_asteroid_texture():
	# Returns random integer between 1 and 90
	var random_number = randi() % 90 + 1
	return "res://Art/Planets/asteroids" + str(random_number) + ".png"


# first we need to think about generating one planet. Since we want the generator to create the
# planet the way it sees fit we will first write a prototype method that generates a very specific
# planet (with an asteroid belt because that's a badass idea)

# we'll have a helper func that generates an asteroid, this method will take the desired ratio of
# ASTEROID_SIZE_SMALL, ASTEROID_SIZE_MEDIUM, ASTEROID_SIZE_LARGE
func generate_asteroid(size):
	var sprite = Sprite2D.new()
	var texture = get_asteroid_texture()
	sprite.transform.set_scale(size)
	
# once in prod, we'll coin flip 5 times and if it get's head 3 times it gets an asteroid belt
func generate_asteroid_belt_check():
	pass
	
func generate_starting_planet():
	pass
	
func generate_celestial_bodies():
	pass
	
func generate_tacos(celestial_bodies):
	pass
	

func generate_planet():
	# var ab_check = generate_asteroid_belt_check()
	pass
	
# second we'll make two more methods that do the same but generate moons and standalone asteroids
