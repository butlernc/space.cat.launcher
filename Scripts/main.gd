extends Node2D
signal initial_game
signal planet_reached
signal game_over
var score = 0


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
	
func _on_taco_collected():
	score += 1
	get_node("HUD/CanvasLayer/Score").text = str(score)
	

	

	

	
	

