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
