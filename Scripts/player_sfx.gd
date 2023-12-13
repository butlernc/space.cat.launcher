extends Node2D


func launch():
	$Launch.play()


func land():
	$Landed.play()


func reset():
	$Reset.play()


func taco_pickup():
	$TacoPickup.play()
	$TacoPickupDing.play()
