extends Camera2D


var px_viewport_size = Vector2(960, 540)
var left_edge = -480
var right_edge = 480
var top_edge = 270
var bottom_edge = -270

var maxSpeed: float = 50.0
var rampUpTime: float = 1.0

var currentSpeed: float = 0.0
var targetSpeed: float = 5.0
var deadzone = 20.0


# Called when the node enters the scene tree for the first time.
func _ready():
#	viewport_size = get_viewport().size
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var local_mouse_pos = get_local_mouse_position()
#	if local_mouse_pos.x < deadzone:
#		targetSpeed = -maxSpeed
#	elif local_mouse_pos.x > screenSize.x - deadzone:
#		targetSpeed.x = maxSpeed
#	else:
#		targetSpeed.x = 0.0
#
#
#	if local_mouse_pos.y < deadzone:
#		targetSpeed.y = -maxSpeed
#	elif local_mouse_pos.y > screenSize.y - deadzone:
#		targetSpeed.y = maxSpeed
#	else:
#		targetSpeed.y = 0.0
#
#	if (local_mouse_pos.x < (left_edge + threshold)):
#		position.x -= get_step()
#	if (local_mouse_pos.x > (right_edge - threshold)):
#		position.x += get_step()
#
#	if (local_mouse_pos.y < (bottom_edge + threshold)):
#		position.y -= get_step()
#	if(local_mouse_pos.y > (top_edge - threshold)):
#		position.y += get_step()
#
#	currentSpeed = lerp(currentSpeed, targetSpeed, delta / rampUpTime)
#	offset.x += currentSpeed.x * delta
#	offset.y += currentSpeed.y * delta
