extends Node2D

signal player_aiming

var lines_container : Node2D

var individual_line_length : int = 20
var line_spacing : int = 5
var line_length : int = (individual_line_length + line_spacing)
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
	if Globals.GUNNER_UI_ON:
		refresh_aim_line()
		player_aiming.emit()
	
func on_right_click_release():
	remove_aim_line()

func on_left_click():
	remove_aim_line()
	
func is_creating_last_line(current_length, individual_line_length, max_lines):
	return (current_length + individual_line_length) > (individual_line_length * (max_lines - 1))
	
func refresh_aim_line():
	remove_aim_line()
	# if we are just starting or lines_container has been gc'd we instan a new one
	create_aim_line()
		
	var mouse_position = get_global_mouse_position()
	var player_position = get_parent().get_node("Player").position
	
	var distance = player_position.distance_to(mouse_position)
	var angle = player_position.direction_to(mouse_position)
	var max_lines = floor(distance / line_length)
	var current_length = 0.0
	var index = 0
	
	while current_length < line_length * (max_lines - 1):
		index += 1
		current_length += line_length
		var start_point = (player_position + angle * current_length)
		var line_variability = (index + 10)
		if(line_variability > individual_line_length):
			line_variability = individual_line_length
		var end_point = (start_point + angle * line_variability)
		
		
		create_line(start_point, end_point, index)
		
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
	
func create_line(p1 : Vector2, p2 : Vector2, index):
	var line2D = Line2D.new()
	line2D.set_default_color(Color8(194, 45, 25))
	if(index <= 3):
		line2D.set_default_color(Color8(70, 194, 25))
	elif(index <= 6):
		line2D.set_default_color(Color8(194, 180, 25))
	elif(index <= 9):
		line2D.set_default_color(Color8(194, 79, 25))
	elif(index >= 10):
		line2D.set_default_color(Color8(194, 45, 25))
	
	line2D.set_antialiased(true)
	line2D.set_width(2.0)
	line2D.add_point(p1)
	line2D.add_point(p2)
	lines_container.add_child(line2D)
