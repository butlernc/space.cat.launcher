extends Area2D
signal taco_collected

var type = Globals.BODY_TYPE_TACO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_body_entered(body):
	if("type" in body):
		print(body.name,body.type)
		match(body.type):
			Globals.BODY_TYPE_CAT:
				taco_collected.emit()
				queue_free()
				
				
