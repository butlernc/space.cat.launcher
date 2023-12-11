extends Node

@onready var sfx_confirm = $SFX/Confirm
@onready var sfx_cancel = $SFX/Cancel

# Called when the node enters the scene tree for the first time.
func _ready():
	$Music.fade_in()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	Sfx.confirm()
	Globals.change_to_main_scene()

func _on_quit_button_pressed():
	Sfx.cancel()
	Globals.exit_game()
