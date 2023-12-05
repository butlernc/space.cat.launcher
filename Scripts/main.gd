extends Node2D
signal initial_game
signal planet_reached
signal game_over
var score = 0
var PlanetConfig = load("res://Scripts/PlanetConfig.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func planet_strike():
	pass

func new_game():
	$Player.start($StartPosition.position)
	generate_planets(load("res://Levels/level_1.tres"))
	
func _on_taco_collected():
	score += 1
	get_node("HUD/CanvasLayer/Score").text = str(score)
	
func generate_planets(planet_list):
	print(planet_list)
	for planet_config_map in planet_list.data:
		var planet_config = PlanetConfig.new(planet_config_map)
		planet_config.generate(self)
		


	

	

	

	
	

