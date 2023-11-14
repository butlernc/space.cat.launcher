extends RigidBody2D
signal hit

var force = 5000
var screen_size
var collision = false
var shot_fired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func on_left_click():
	pass
	
func fire(state):
	# Get the mouse position
	var mouse_position = get_global_mouse_position()
	Globals.GUNNER_UI_SW = false

	var direction = (mouse_position - state.transform.origin).normalized()

	# Set the linear velocity based on the direction and force
	if !shot_fired:
		state.apply_force(direction * force)
		shot_fired = true

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
		
func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
	if Input.is_action_pressed("left_mouse_click"):
		fire(state)
		
		

func _on_body_entered(_body):
	hit.emit()
	collision = true
	$CollisionShape2D.set_deferred("disabled", true)
