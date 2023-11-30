extends Node2D
signal initial_game
signal planet_reached
signal game_over


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

func on_player_collision():
	pass
	
func on_reset():
	$Player.reset()

	

	

	
	

