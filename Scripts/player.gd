extends RigidBody2D
signal hit

var speed = 1000
var screen_size
var collision = false

var line2d_template : Line2D
var lines_container : Node2D

var line_length : float = 20.0
var line_spacing : float = 5.0
var max_lines : int = 10
var shot_fired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("_ready")
	screen_size = get_viewport_rect().size
	hide()
	line2d_template = preload("res://Scenes/AimLine.tscn").instantiate()
	lines_container = Node2D.new()
	add_child(lines_container)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_lines()
	# if !collision:
	#	set_position(position + move_direction.normalized())

func start(pos):
	var position = pos
	show()
	$CollisionShape2D.disabled = false


func create_line(p1 : Vector2, p2 : Vector2):
	var line_instance = line2d_template.duplicate() as Line2D
	line_instance.add_point(p1, 0)
	line_instance.add_point(p2, 1)
	lines_container.add_child(line_instance)
	
func update_lines():
	if !lines_container:
		lines_container = Node2D.new()
	lines_container.queue_free()  # Remove existing lines
	var mouse_position = get_global_mouse_position()
	var player_position = global_position
	
	var distance = player_position.distance_to(mouse_position)
	var angle = player_position.direction_to(mouse_position)
	
	var current_length = 0.0
	var lines_added = 0
	
	while current_length < line_length * max_lines:
		current_length += line_length + line_spacing
		var start_point = (global_position + angle * current_length)
		var end_point = (start_point + angle * line_length)
		lines_added += 1
		

func _integrate_forces(state):
	# Check if the mouse button is pressed (left mouse button)
	if Input.is_action_pressed("left_mouse_click"):
		print("hello")
		# Get the mouse position
		var target_position = get_global_mouse_position()

		var direction = (target_position - state.transform.origin).normalized()

		# Set the linear velocity based on the direction and speed
		if !shot_fired:
			state.apply_force(direction * speed)
			shot_fired = true

func _on_body_entered(body):
	hit.emit()
	collision = true
	$CollisionShape2D.set_deferred("disabled", true)
