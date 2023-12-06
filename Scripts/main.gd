extends Node2D
signal start
signal game_over
signal winner_winner

var score = 0
var pause_overlay
var PlanetConfig = load("res://Scripts/PlanetConfig.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_just_pressed("pause")):
		if(get_tree().is_paused()):
			resume()
		else:
			pause()
		

func new_game():
	$Player.start($StartPosition.position)
	pause_overlay = get_node("HUD/CanvasLayer/PauseHUD")
	generate_planets(load("res://Levels/level_1.tres"))
	pause_overlay.hide()
	start.emit()
	
func _on_taco_collected():
	score += 1
	get_node("HUD/CanvasLayer/Score").text = str(score)
	if(score == Globals.SCORE_LIMIT):
		winner_winner.emit()
	
func generate_planets(planet_list):
	print(planet_list)
	for planet_config_map in planet_list.data:
		var planet_config = PlanetConfig.new(planet_config_map)
		planet_config.generate(self)
		
func _on_timer_finished():
	if(score < Globals.SCORE_LIMIT):
		game_over.emit()
		
func pause():
	get_tree().set_pause(true)
	pause_overlay.show()
	
func resume():
	get_tree().set_pause(false)
	pause_overlay.hide()
	
func _on_exit_button_pressed():
	resume()
	Globals.change_to_menu_scene()
		
	
		


	

	

	

	
	

