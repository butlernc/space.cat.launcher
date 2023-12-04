extends Object

var PLANET_GRAVITY_RADIUS_RATIO = 1.5
var radius = 0
var gravity_radius = 0
var position = Vector2(0, 0)
var orbit_planets = []
var sprite_path = ""


func _init(config):
	radius = config.radius
	gravity_radius = (radius * PLANET_GRAVITY_RADIUS_RATIO)
	position = Vector2(config.x, config.y)
	sprite_path = config.sprite_path
	# TODO: add orbiting planets
	
func generate(parent_node):
	
	# To generate a planet we need:
	# Node2D for the wrapper/container w/config'd:
	# position
	var container_node = Node2D.new()
	container_node.set_position(position)
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
	gravity_area.set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_COMBINE)
	gravity_area.set_gravity_is_point(true)
	gravity_area.set_gravity_point_unit_distance(radius)
	gravity_area.set_collision_layer(2)
	gravity_area.set_collision_mask(2)
	var gravity_area_cs = CollisionShape2D.new()
	var gravity_area_cs_cs = CircleShape2D.new()
	gravity_area_cs_cs.set_radius(gravity_radius)
	gravity_area_cs.set_shape(gravity_area_cs_cs)
	gravity_area.add_child(gravity_area_cs)
	container_node.add_child(gravity_area)
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
	rigid_body.set_script(load("res://Scripts/planet.gd"))
	rigid_body.set_freeze_enabled(true)
	rigid_body.set_freeze_mode(rigid_body.FREEZE_MODE_STATIC)
	var rigid_body_cs = CollisionShape2D.new()
	var rigid_body_cs_cs = CircleShape2D.new()
	rigid_body_cs_cs.set_radius(radius)
	rigid_body_cs.set_shape(rigid_body_cs_cs)
	rigid_body.add_child(rigid_body_cs)
	container_node.add_child(rigid_body)
	# Sprite2D
	# texture: passed in
	var planet_sprite = Sprite2D.new()
	print(sprite_path)
	planet_sprite.set_texture(load(sprite_path))
	container_node.add_child(planet_sprite)
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
	parent_node.add_child(container_node)
