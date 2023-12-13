extends Timer

var label

# Called when the node enters the scene tree for the first time.
func _ready():
	label = get_child(0) as Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "%d:%02d" % [floor(get_time_left() / 60), int(get_time_left()) % 60]
	
func on_game_start():
	start(98)
