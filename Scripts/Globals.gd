extends Node

var GUNNER_UI_ON = true
var BODY_TYPE_PLANET = "BODY_TYPE_PLANET"
var BODY_TYPE_TACO = "BODY_TYPE_TACO"
var BODY_TYPE_CAT = "BODY_TYPE_CAT"
var TACO_COUNT = 0
var score = 0
var shots_taken = 0

var BOUNDARY_SCENE_PATH = "res://Scenes/boundary.tscn"

func change_to_main_scene():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func change_to_menu_scene():
	Sfx.stop_bgm()
	Sfx.reset_sfx()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func change_to_end_scene():
	Sfx.stop_bgm()
	Sfx.end_game()
	get_tree().change_scene_to_file("res://Scenes/end_game.tscn")

func exit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
