extends Control

var is_resumable = false
var wait_amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(wait_amount >= 2):
		is_resumable = true
		
	wait_amount += delta


func set_wait_amount(v):
	wait_amount = v
	
	

	
