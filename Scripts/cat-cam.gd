extends AnimatedSprite2D

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_player_cat_landed():
	var total_frames = sprite_frames.get_frame_count("landed")
	var random_frame = randi() % total_frames
	frame = random_frame
	
func _on_player_cat_launched():
	var total_frames = sprite_frames.get_frame_count("launched")
	var random_frame = randi() % total_frames
	frame = random_frame
	
func _on_aim_lines_player_aiming():
	var total_frames = sprite_frames.get_frame_count("player_aiming")
	var random_frame = randi() % total_frames
	frame = random_frame
