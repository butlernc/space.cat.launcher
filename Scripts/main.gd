extends Node2D
signal start
signal game_over

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
			
	if(Globals.score == Globals.TACO_COUNT):
		Globals.change_to_end_scene()
		

func new_game():
	$Player.start($StartPosition.position)
	pause_overlay = get_node("HUD/CanvasLayer/PauseHUD")
	Globals.TACO_COUNT = get_node("./Taco").get_child_count()
	# generate_planets(load("res://Levels/level_1.tres"))
	pause_overlay.hide()
	start.emit()
	
	
func _on_taco_collected():
	Globals.score += 1
	get_node("HUD/CanvasLayer/Score").text = str(Globals.score)
	
func _on_cat_launched():
	Globals.shots_taken += 1
	get_node("HUD/CanvasLayer/ShotsTaken").text = str(Globals.shots_taken)
	
	
func generate_planets(planet_list):
	for planet_config_map in planet_list.data:
		var planet_config = PlanetConfig.new(planet_config_map)
		planet_config.generate(self)
		
		
func _on_timer_finished():
	Globals.change_to_end_scene()
		
		
func pause():
	get_tree().set_pause(true)
	pause_overlay.show()
	
func resume():
	get_tree().set_pause(false)
	pause_overlay.hide()
	
func _on_main_menu_button_pressed():
	resume()
	Globals.change_to_menu_scene()
	
func _on_exit_game_button_pressed():
	Globals.exit_game()
		
	
		


	

	

	

	
	

