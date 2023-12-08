extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_linear_damp_space_override_mode(Area2D.SPACE_OVERRIDE_COMBINE)
	set_linear_damp(1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
