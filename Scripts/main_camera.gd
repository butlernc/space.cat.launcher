extends Camera2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent().get_node("Player")
	var mouse_offset = get_local_mouse_position() + Vector2(120, 68)
	position = player.position
	offset = lerp(Vector2(), mouse_offset.normalized() * 300, mouse_offset.length() / 1000)

