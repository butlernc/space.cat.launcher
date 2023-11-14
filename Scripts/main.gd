extends Node2D

var score


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func planet_strike():
	pass

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	

	

	
	

