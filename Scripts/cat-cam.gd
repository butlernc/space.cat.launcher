extends AnimatedSprite2D


var changing_portrait : bool = false  # Flag to track if portrait change is in progress
var original_position : Vector2  # Variable to store the original position
@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_cat_launched():
	print("launched")
	_animated_sprite.play("launched")
		
func _on_cat_landed():
	print("landed")
	_animated_sprite.play("landed")
	
func _on_player_aiming():
	print("player_aiming")
	_animated_sprite.play("player_aiming")
