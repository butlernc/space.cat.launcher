extends RigidBody2D
signal collided
signal cat_fired

var force = 100
var collision = false
var shot_fired = false

var initial_position : Vector2
var initial_rotation : float
var reset_rigidbody_state : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = position
	initial_rotation = rotation
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func on_left_click():
	pass
	
func fire(state):
	# Get the mouse position
	
	# Set the linear velocity based on the direction and force
	if !shot_fired:
		cat_fired.emit()
		shot_fired = true
		reset_rigidbody_state = false
		
		var mouse_position = get_global_mouse_position()
		var direction = (mouse_position - state.transform.origin).normalized()
		
		state.apply_force(direction * force)
		

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func reset():
	reset_rigidbody_state = true
	position = initial_position
	rotation = initial_rotation
	shot_fired = false
	
		
func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
		
	if reset_rigidbody_state:
		state.apply_force(Vector2.ZERO)
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0
		state.transform.origin = initial_position
	
	if Input.is_action_pressed("left_mouse_click"):
		fire(state)
		
func _on_body_entered(_body):
	collided.emit()
	collision = true
	$CollisionShape2D.set_deferred("disabled", true)
