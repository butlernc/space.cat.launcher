extends Sprite2D

var semi_major_axis
var eccentricity
var orbital_speed
var mean_anomaly
var base_radius = 3200

# Called when the node enters the scene tree for the first time.
func _ready():
	semi_major_axis = randi_range(base_radius - 150, base_radius)
	eccentricity = 0
	orbital_speed = randf_range(.1, .15)
	mean_anomaly = randi_range(0, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_kepler_orbit(delta)


	
func apply_kepler_orbit(delta: float) -> void:
	# Update mean anomaly based on orbital speed
	mean_anomaly += delta * orbital_speed

	# Calculate eccentric anomaly using an iterative method (Newton's method)
	var eccentric_anomaly : float = mean_anomaly
	for x in range(5):  # Perform 5 iterations for better accuracy
		eccentric_anomaly = mean_anomaly + eccentricity * sin(eccentric_anomaly)

	# Calculate true anomaly
	var true_anomaly : float = 2.0 * atan2(sqrt(1.0 + eccentricity) * sin(eccentric_anomaly / 2.0),
										  sqrt(1.0 - eccentricity) * cos(eccentric_anomaly / 2.0))

	# Calculate distance from focus (distance from the center_node)
	var distance : float = semi_major_axis * (1.0 - eccentricity * cos(eccentric_anomaly))

	# Calculate position in orbit relative to the center_node
	var x : float = distance * cos(true_anomaly)
	var y : float = distance * sin(true_anomaly)

	# Set the position of the asteroid node relative to the center_node
	position = Vector2(x, y)
