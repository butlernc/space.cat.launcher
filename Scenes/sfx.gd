extends Node


func confirm():
	$"Confirm".play()

func cancel():
	$Cancel.play()

func reset():
	$Reset.play()

func launch():
	$Launch.play()

func land():
	$Landed.play()
	
func taco_pickup():
	$TacoPickup.play()
	$TacoPickupDing.play()

func end_game():
	$EndGame.play()

func main_bgm():
	$BGM.play()
	
func reset_sfx():
	$EndGame.stop()

func stop_bgm():
	$BGM.stop()
