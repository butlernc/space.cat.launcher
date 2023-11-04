extends Area2D
signal hit

var move_direction = Vector2(2, -1)
var move_speed = 100
var screen_size
var collision = false

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !collision:
		set_position(position + move_direction.normalized())

func _on_body_entered(body):
	hit.emit()
	collision = true
	$CollisionShape2D.set_deferred("disabled", true)
