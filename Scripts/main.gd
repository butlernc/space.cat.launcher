extends Node2D
signal start
signal game_over

var pause_overlay
var PlanetConfig = load("res://Scripts/PlanetConfig.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	Sfx.main_bgm()
	new_game()


func _on_ready():
	setup_boundary()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(Input.is_action_just_pressed("pause")):
		if(get_tree().is_paused()):
			resume()
		else:
			pause()


func setup_boundary():
	var boundary_scene = ResourceLoader.load_threaded_get(Globals.BOUNDARY_SCENE_PATH)
	# Instantiate the enemy scene and add it to the current scene
	var boundary = boundary_scene.instantiate()
	boundary.body_exited.connect($Player._on_boundary_body_exited)
	add_child(boundary)

func new_game():
	
	$Player.start($StartPosition.position)
	
	pause_overlay = get_node("HUD/CanvasLayer/PauseHUD")
	Globals.score = 0
	update_taco_hud_display()
	pause_overlay.hide()
	start.emit()
	Globals.timer_finished = false
	

func update_taco_hud_display():
	get_node("HUD/CanvasLayer/Score").text = str(Globals.score)
	
	
func _on_taco_collected():
	Globals.score += 1
	$Player/SFX.taco_pickup()
	update_taco_hud_display()
	
func _on_cat_launched():
	Globals.shots_taken += 1
	$Player/SFX.launch()
	get_node("HUD/CanvasLayer/ShotsTaken").text = str(Globals.shots_taken) 
	
	
func generate_planets(planet_list):
	for planet_config_map in planet_list.data:
		var planet_config = PlanetConfig.new(planet_config_map)
		planet_config.generate(self)
		
		
func _on_timer_finished():
	Globals.change_to_end_scene()
	Globals.timer_finished = true
		
func pause():
	get_tree().set_pause(true)
	pause_overlay.show()
	
func resume():
	get_tree().set_pause(false)
	pause_overlay.hide()
	
func _on_main_menu_button_pressed():
	resume()
	Sfx.confirm()
	Globals.change_to_menu_scene()
	
func _on_exit_game_button_pressed():
	Sfx.cancel()
	Globals.exit_game()
	
func _on_player_taco_penalty():
	Globals.score -= 50
	update_taco_hud_display()
