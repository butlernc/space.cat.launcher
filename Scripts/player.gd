extends RigidBody2D
signal hit

var force = 5000
var screen_size
var collision = false

var shot_fired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("_ready")
	screen_size = get_viewport_rect().size
	hide()
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start(pos):
	var position = pos
	show()
	$CollisionShape2D.disabled = false
		
func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
	if Input.is_action_pressed("left_mouse_click"):
		# Get the mouse position
		var target_position = get_global_mouse_position()

		var direction = (target_position - state.transform.origin).normalized()

		# Set the linear velocity based on the direction and force
		if !shot_fired:
			state.apply_force(direction * force)
			shot_fired = true

func _on_body_entered(body):
	hit.emit()
	collision = true
	$CollisionShape2D.set_deferred("disabled", true)
