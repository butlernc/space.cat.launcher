extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func new_game():
	print($StartPosition.position)
	print($Player.position)
	$Player.start($StartPosition.position)

func on_player_collision():
	pass
	
func on_reset():
	$Player.reset()

	

	

	
	

