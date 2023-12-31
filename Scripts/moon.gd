extends Node2D

# Kepler Orbit Parameters
@export var semi_major_axis : float = 200.0  # Semi-major axis of the orbit
var eccentricity : float = 0.1        # Eccentricity of the orbit aka how oblong
var orbital_speed : float = 0.1     # Orbital speed
# Mean anomaly is a persistent value, so we'll track it across frames
var mean_anomaly : float = 0.0
var is_clockwise_orbit = false
var rotation_limiter = 10


func _ready():
	get_node("Small1RigidBody").set_freeze_enabled(true)
	var which_way = randi_range(0, 50)
	is_clockwise_orbit = which_way > 25
	mean_anomaly = randi_range(0, 500)
	semi_major_axis = randi_range(200, 300)
	eccentricity = randf_range(0.1, 0.3)
	orbital_speed = randf_range(.1, .2)
	
func clockwise_orbit(delta): 
	# "positive orbit"
	rotation = (rotation + (delta / rotation_limiter))
	return mean_anomaly + (delta * orbital_speed)
	
func counter_clockwise_orbit(delta):
	# "negative orbit"
	rotation = (rotation - (delta / rotation_limiter))
	return mean_anomaly - (delta * orbital_speed)

# Function to update the position based on Kepler orbit
func apply_kepler_orbit(delta: float) -> void:
	# Update mean anomaly based on orbital speed
	mean_anomaly = clockwise_orbit(delta) if is_clockwise_orbit else counter_clockwise_orbit(delta)
	# Calculate eccentric anomaly using an iterative method (Newton's method)
	var eccentric_anomaly : float = mean_anomaly
	for _x in range(5):  # Perform 5 iterations for better accuracy
		eccentric_anomaly = mean_anomaly + eccentricity * sin(eccentric_anomaly)

	# Calculate true anomaly
	var true_anomaly : float = 2.0 * atan2(sqrt(1.0 + eccentricity) * sin(eccentric_anomaly / 2.0),
										  sqrt(1.0 - eccentricity) * cos(eccentric_anomaly / 2.0))

	# Calculate distance from focus
	var distance : float = semi_major_axis * (1.0 - eccentricity * cos(eccentric_anomaly))

	# Calculate position in orbit
	var x : float = distance * cos(true_anomaly)
	var y : float = distance * sin(true_anomaly)

	position = Vector2(x, y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_kepler_orbit(delta)

