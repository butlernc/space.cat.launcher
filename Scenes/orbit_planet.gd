extends RigidBody2D

# Kepler Orbit Parameters
var semi_major_axis : float = 200.0  # Semi-major axis of the orbit
var eccentricity : float = 0.5        # Eccentricity of the orbit aka how oblong
var orbital_speed : float = 1.0     # Orbital speed
# Mean anomaly is a persistent value, so we'll track it across frames
var mean_anomaly : float = 0.0
# Center node around which the RigidBody2D orbits
var center_node : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	center_node = get_parent().get_parent().get_node("Large/PlanetA")


func clockwise_orbit(mean_anomaly, delta, orbital_speed): 
	# "positive orbit"
	# mean_anomaly += delta * orbital_speed
	return mean_anomaly
	
func counter_clockwise_orbit(mean_anomaly, delta, orbital_speed):
	# "negative orbit"
	# mean_anomaly -= delta * orbital_speed
	return mean_anomaly

# Function to update the position based on Kepler orbit
func apply_kepler_orbit(delta: float) -> void:
	# Ensure we have a valid center_node
	if center_node == null:
		return

	# Update mean anomaly based on orbital speed
	mean_anomaly -= delta * orbital_speed

	# Calculate eccentric anomaly using an iterative method (Newton's method)
	var eccentric_anomaly : float = mean_anomaly
	for _x in range(5):  # Perform 5 iterations for better accuracy
		eccentric_anomaly = mean_anomaly + eccentricity * sin(eccentric_anomaly)

	# Calculate true anomaly
	var true_anomaly : float = 2.0 * atan2(sqrt(1.0 + eccentricity) * sin(eccentric_anomaly / 2.0),
										  sqrt(1.0 - eccentricity) * cos(eccentric_anomaly / 2.0))

	# Calculate distance from focus (distance from the center_node)
	var distance : float = semi_major_axis * (1.0 - eccentricity * cos(eccentric_anomaly))

	# Calculate position in orbit relative to the center_node
	var x : float = distance * cos(true_anomaly)
	var y : float = distance * sin(true_anomaly)

	# Set the position of the RigidBody2D relative to the center_node
	position = center_node.position + Vector2(x, y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_kepler_orbit(delta)
