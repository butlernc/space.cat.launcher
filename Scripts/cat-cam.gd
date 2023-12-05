extends AnimatedSprite2D
var is_first_time_aiming_on_planet = false

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_player_cat_landed():
	is_first_time_aiming_on_planet = true
	random_frame("landed")
	
func _on_player_cat_launched():
	random_frame("launched")
	
	
func _on_aim_lines_player_aiming():
	if(is_first_time_aiming_on_planet):
		random_frame("player_aiming")
		is_first_time_aiming_on_planet = false


func random_frame(context):
	var total_frames = sprite_frames.get_frame_count(context)
	var random_frame = randi() % total_frames
	frame = random_frame
