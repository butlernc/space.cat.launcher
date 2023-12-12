extends Camera2D

enum DIRECTION {
	RIGHT,
	LEFT,
	TOP,
	BOTTOM
}

var px_viewport_size = Vector2(960, 540)
var left_edge = -480
var right_edge = 480
var top_edge = 270
var bottom_edge = -270

var maxSpeed: float = 50.0
var rampUpTime: float = 1.0

var currentSpeed: Vector2 = Vector2(0.0, 0.0)
var targetSpeed: Vector2 = Vector2(0.0, 0.0)
var deadzone_buffer = 20.0


# Called when the node enters the scene tree for the first time.
func _ready():
#	viewport_size = get_viewport().size
	pass


func get_deadzone(direction : DIRECTION):
	var deadzone
	match(direction):
		DIRECTION.RIGHT:
			deadzone = right_edge - deadzone_buffer
		DIRECTION.LEFT:
			deadzone = left_edge + deadzone_buffer
		DIRECTION.TOP:
			deadzone = top_edge - deadzone_buffer
		DIRECTION.BOTTOM:
			deadzone = bottom_edge + deadzone_buffer
	return deadzone
	
	
func lock_on():
	var player_position = get_parent().get_node("Player").get_position()
	targetSpeed.x = 0
	targetSpeed.y = 0
	print(player_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var local_mouse_pos = get_local_mouse_position()
	
	if local_mouse_pos.x <= get_deadzone(DIRECTION.LEFT):
		targetSpeed.x = -maxSpeed
	elif local_mouse_pos.x > get_deadzone(DIRECTION.RIGHT):
		targetSpeed.x = maxSpeed
	else:
		lock_on()

	if local_mouse_pos.y < get_deadzone(DIRECTION.BOTTOM):
		targetSpeed.y = -maxSpeed
	elif local_mouse_pos.y > get_deadzone(DIRECTION.TOP):
		targetSpeed.y = maxSpeed
	else:
		targetSpeed.y = 0.0

	currentSpeed = lerp(currentSpeed, targetSpeed, delta / rampUpTime)
	offset.x += currentSpeed.x * delta
	offset.y += currentSpeed.y * delta
