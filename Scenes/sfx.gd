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

func end_game():
	$EndGame.play()
