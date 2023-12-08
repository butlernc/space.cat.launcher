extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/ShotsTaken.text = str(Globals.shots_taken)
	$Control/Tacos.text = str(Globals.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_game_button_pressed():
	Globals.exit_game()


func _on_main_menu_button_pressed():
	Globals.change_to_main_scene()
