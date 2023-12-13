extends Node


func confirm():
	$Confirm.play()


func cancel():
	$Cancel.play()


func end_game():
	$EndGame.play()


func main_bgm():
	$BGM.play()


func stop_bgm():
	$BGM.stop()


func reset_sfx():
	$EndGame.stop()
