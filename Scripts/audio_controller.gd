extends Node

# References to the nodes in our scene
@onready var fader := $AnimationPlayer
@onready var music := $MusicPlayer


# fade in track
func fade_in():
	music.play()
	fader.play("fade")
	
	
