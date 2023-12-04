extends Node2D
signal initial_game
signal planet_reached
signal game_over
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func planet_strike():
	pass

func new_game():
	$Player.start($StartPosition.position)
	
func _on_taco_collected():
	score += 1
	get_node("HUD/CanvasLayer/Score").text = str(score)
	
func generate_planets(planet_list):
	for planet_config in planet_list:
		generate_planet(planet_config)
		

func generate_planet(planet_config):
	var planet_radius = 80
	var planet_gravity_radius = 120
	var planet_sprite_path = "res://Art/Planets/big_planets11.png"
	# To generate a planet we need:
	# Node2D for the wrapper/container w/config'd:
	# position
	var container_node = Node2D.new()
	container_node.set_position(planet_config.position)
	# Area2D for the gravity wrapper/container w/config'd:
	# Monitoring: true (default)
	# Monitorable: true (default)
	# space override: SPACE_OVERRIDE_COMBINE, 1
	# point: true
	# point unit distance: 80px (affected by size)
	# gravity: 980 px/s2 (default) (affected by size)
	# collision layer: 2
	# collision mask: 2
	# CollisionShape2D
	# CircleShape2D
	# radius: 120px (affected by size)
	var gravity_area = Area2D.new()
	gravity_area.set_gravity_space_override(Area2D.SPACE_OVERRIDE_COMBINE)
	gravity_area.set_gravity_point(true)
	gravity_area.set_gravity_point_unit_distance(planet_radius)
	gravity_area.set_collision_layer(2)
	gravity_area.set_collision_mask(2)
	var gravity_area_cs = CollisionShape2D.new()
	var gravity_area_cs_cs = CircleShape2D.new()
	gravity_area_cs_cs.set_radius(planet_gravity_radius)
	gravity_area_cs.set_shape(gravity_area_cs_cs)
	gravity_area.add_child(gravity_area)
	# RigidBody2D
	# script: Planet
	# freeze: true
	# freeze mode: FREEZE_MODE_STATIC, 0
	# collision layer: 1 (default)
	# collision mask: 1 (default)
	# CollisionShape2D
	# CircleShape2D
	# radius: 80px (affected by size)
	var rigid_body = RigidBody2D.new()
	rigid_body.set_script("res://Scripts/planet.gd")
	rigid_body.set_freeze(true)
	rigid_body.set_freeze_mode(rigid_body.FREEZE_MODE_STATIC)
	var rigid_body_cs = CollisionShape2D.new()
	var rigid_body_cs_cs = CircleShape2D.new()
	rigid_body_cs_cs.set_radius(planet_radius)
	rigid_body_cs.add_child(rigid_body_cs_cs)
	# Sprite2D
	# texture: passed in
	var planet_sprite = Sprite2D.new()
	planet_sprite.set_texture(planet_sprite_path)
	# Any Orbiting Planets (Each need the following)
	# RigidBody2D
	# script: orbit_planet
	#
	# CollisionShape2D
	# CircleShape2D
	# radius: size of sprite
	#
	# Sprite2D
	# texture: passed in
	

	

	

	
	

