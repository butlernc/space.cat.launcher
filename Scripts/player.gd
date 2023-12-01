extends RigidBody2D
signal cat_launched
signal taco_collected

var force = 700
var launched = false

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

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
func reset_launcher():
	launched = false
	Globals.GUNNER_UI_ON = true
	

func reset():
	reset_rigidbody_state = true		
	reset_launcher()
		
func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
		
	if reset_rigidbody_state:
		position = initial_position
		rotation = initial_rotation
		#state.apply_impulse(Vector2.ZERO)
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0
		state.transform.origin = initial_position
	
	if Input.is_action_pressed("left_mouse_click"):
		if !launched:
			cat_launched.emit()
			Globals.GUNNER_UI_ON = false
			launched = true
			reset_rigidbody_state = false
			
			var mouse_position = get_global_mouse_position()
			var direction = (mouse_position - state.transform.origin).normalized()
			
			state.apply_impulse(direction * force)



func _on_body_entered(body):
	if(launched && ("type" in body)):
		print(body.type)
		match(body.type):
			Globals.BODY_TYPE_PLANET:
				reset_launcher()
			Globals.BODY_TYPE_TACO:
				body.queue_free()
				taco_collected.emit()
