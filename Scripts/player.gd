extends RigidBody2D
signal cat_launched
signal cat_landed

@onready var _animated_sprite = $AnimatedSprite2D

var type = Globals.BODY_TYPE_CAT
#var force = 400
var force = 400 * 15
var launched = false
var landed = true
var landed_notified = true
var prime_reset = false
var is_aiming = false

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
#
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
	reset_launcher()
	$SFX.reset()
	landed = true
	landed_notified = true
	is_aiming = false
	reset_rigidbody_state = true
	
func emit_landing():
	if(!landed_notified):
		cat_landed.emit()
		landed_notified = true
	
		
func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
	if(abs(state.linear_velocity) < Vector2(5,5) && !prime_reset):
		prime_reset = true
		
	if prime_reset:
		# print(state.linear_velocity)
		if(abs(state.linear_velocity) < Vector2(5,5)):
			reset_launcher()
			landed = true
			prime_reset = false
			emit_landing()
			_animated_sprite.play("landed")
		
	if reset_rigidbody_state:
		position = initial_position
		rotation = initial_rotation
		#state.apply_impulse(Vector2.ZERO)
		state.linear_velocity = Vector2.ZERO
		state.angular_velocity = 0
		state.transform.origin = initial_position
		state.apply_force(Vector2.ZERO)
		emit_landing()
		
	if Input.is_action_pressed("right_mouse_click"):
		is_aiming = true
		_animated_sprite.play("player_aiming")
	if Input.is_action_just_released("right_mouse_click"):
		is_aiming = false
		_animated_sprite.play("landed")
		if(launched):
			_animated_sprite.play("launched")
			
		
		
		
	if Input.is_action_pressed("left_mouse_click") && is_aiming:
		if !launched:
			var mouse_position = get_global_mouse_position()
			var direction = (mouse_position - state.transform.origin).normalized()
			var distance = state.transform.origin.distance_to(mouse_position)
			
			if(distance > 50):
				print(distance)
				cat_launched.emit()
				Globals.GUNNER_UI_ON = false
				launched = true
				landed = false
				landed_notified = false
				reset_rigidbody_state = false
				state.apply_impulse(direction * force * (distance / 150))
				_animated_sprite.play("launched")



func _on_body_entered(body):
	if(launched && ("type" in body)):
		print(body.name,body.type)
		match(body.type):
			Globals.BODY_TYPE_PLANET:
				# now that they've hit the planet we need them to stop before they can launch again
				# prime_reset starts the process of waiting for the cat to stop moving, if the cat doesn't stop moving
				# after 7 seconds we stop trying to reset the launcher because they probably bounced off a planet.
				prime_reset = true
				$SFX.land()



func _on_reset_pressed():
	reset()

func _on_boundary_body_exited(body):
	reset()
