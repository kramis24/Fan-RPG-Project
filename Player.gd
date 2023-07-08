# Player.gd
# Handles inputs and actions for player.

extends KinematicBody


# variables
var analog_mode = true
var base_speed
var walk_speed = 5
var dash_speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	base_speed = walk_speed # default speed to base level

# joystick input testing
# source: https://ask.godotengine.org/97054/xbox-gamepad-how-to-use-analog-sticks
func _input(event):
	if event is InputEventJoypadMotion:
		print(
				"Device: %s. Joypad Axis Index: %s. Strength: %s."
				% [event.device, event.axis, event.axis_value]
			)

# input handling and movement
func _physics_process(delta):
	
	# dash toggle
	if Input.is_action_just_pressed("dash"):
		base_speed = dash_speed
	if Input.is_action_just_released("dash"):
		base_speed = walk_speed
	
	# controls for analog inputs like joysticks
	if analog_mode:
		if Input.is_action_pressed("analog_left"):
			var strength = Input.get_action_strength("analog_left")
			translation.x -= base_speed * strength * delta
		if Input.is_action_pressed("analog_right"):
			var strength = Input.get_action_strength("analog_right")
			translation.x += base_speed * strength * delta
		if Input.is_action_pressed("analog_up"):
			var strength = Input.get_action_strength("analog_up")
			translation.z -= base_speed * strength * delta
		if Input.is_action_pressed("analog_down"):
			var strength = Input.get_action_strength("analog_down")
			translation.z += base_speed * strength * delta
			
		# TODO sprite changing
		
	else:
		pass
