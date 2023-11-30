extends Node2D

var lines_container : Node2D

var line_length : int = 20
var line_spacing : int = 5
var total_line_length : int = (line_length + line_spacing)
var lines_container_gced : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("right_mouse_click"):
		on_right_click()
	if Input.is_action_just_released("right_mouse_click"):
		on_right_click_release()
	if Input.is_action_pressed("left_mouse_click"):
		on_left_click()
		
func on_right_click():
	if Globals.GUNNER_UI_SW:
		refresh_aim_line()
	
func on_right_click_release():
	remove_aim_line()

func on_left_click():
	remove_aim_line()
	
func refresh_aim_line():
	remove_aim_line()
	# if we are just starting or lines_container has been gc'd we instan a new one
	create_aim_line()
		
	var mouse_position = get_global_mouse_position()
	get_canvas_item()
	var player_position = get_parent().get_node("Player").position
	
	var distance = player_position.distance_to(mouse_position)
	var angle = player_position.direction_to(mouse_position)
	var max_lines = floor(distance / total_line_length)
	var current_length = 0.0
	
	while current_length <= line_length * max_lines:
		current_length += total_line_length
		var start_point = (player_position + angle * current_length)
		var end_point = (start_point + angle * line_length)
		create_line(start_point, end_point)
		
func create_aim_line():
		remove_aim_line()
		lines_container = Node2D.new()
		add_child(lines_container)
	
func remove_aim_line():
	if !freed() && lines_container != null:
		lines_container.queue_free()	
		lines_container_gced = true

func freed():
	# if we don't have a ref it's been freed
	!weakref(lines_container).get_ref()
	
func create_line(p1 : Vector2, p2 : Vector2):
	# var line_instance = line2d_template.duplicate() as Line2D\
	var line2D = Line2D.new()
	line2D.width = 5
	line2D.add_point(p1)
	line2D.add_point(p2)
	lines_container.add_child(line2D)
