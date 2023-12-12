extends Camera2D


var move_up = false
var move_down = false
var move_left = false
var move_right = false

var maxSpeed: float = 200.0
var rampUpTime: float = 1.0

var currentSpeed: Vector2 = Vector2(0.0, 0.0)
var targetSpeed: Vector2 = Vector2(0.0, 0.0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func triggered_follow():
	pass


func stop_camera():
	move_up = false
	move_down = false
	move_left = false
	move_right = false
	var player_position = get_parent().get_node("Player").get_position()
	targetSpeed.x = 0
	targetSpeed.y = 0
	print(player_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_offset = get_viewport().get_mouse_position()
	#print(mouse_offset)
	print("player position", get_parent().get_node("Player").position)
	print("player position to local", to_local(get_parent().get_node("Player").position))
	#offset = lerp(get_parent().get_node("Player").position, mouse_offset.normalized() * 100, mouse_offset.length() / 1000)
	position = lerp(position, get_parent().get_node("Player").position + Vector2(50, 0), 0.5)
	#if(move_left):
#		targetSpeed.x = -maxSpeed
#
#	if(move_right):
#		targetSpeed.x = maxSpeed
#
#	if(move_down):
#		targetSpeed.y = maxSpeed
#
#	if(move_up):
#		targetSpeed.y = -maxSpeed

#	currentSpeed = lerp(currentSpeed, targetSpeed, delta / rampUpTime)
#	position.x += currentSpeed.x * delta
#	position.y += currentSpeed.y * delta
