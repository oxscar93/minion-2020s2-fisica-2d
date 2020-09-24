extends RigidBody2D

const LEVITATION_SPEED = -100
const GRAVITY = 200
const MAX_HEIGHT = 296
const X_BOX_DIRECTION = 500
const MIN_PLAYER_DISTANCE = 130
const LEVITATION_FORCE = 20

var velocity = Vector2()
var levitating = false
var x_pos =  0
var player
var mouse_entered = false

func _ready():
	player = get_parent().get_node('Player') #inyectar player
	_add_levitation_force(LEVITATION_FORCE)	

func get_input():
	if (Input.is_action_pressed("click") and mouse_entered):
		levitate()

func _physics_process(delta):
	get_input()
	
	if (levitating):
		_start_levitating()	
		_push_box()
			
func levitate():
	var distance = player.global_position.distance_to(position)
	
	if (distance < MIN_PLAYER_DISTANCE):
		x_pos = player.get_direction().x * X_BOX_DIRECTION
		levitating = true
		
func _push_box():
	if (levitating == false):
		yield(get_tree().create_timer(0.3), "timeout")
	
		mode = RigidBody2D.MODE_RIGID			
		apply_central_impulse(Vector2(x_pos, 0))

func _start_levitating():
	var y = global_position.y 	
	
	if (y >= MAX_HEIGHT):	
		set_axis_velocity(Vector2(0, LEVITATION_SPEED))
	else:
		mode = RigidBody2D.MODE_KINEMATIC
		levitating = false	

func _add_levitation_force(y):
	add_force(Vector2(0, 0), Vector2(0, y))
		
func _on_Box_mouse_entered():
	mouse_entered = true
	modulate = Color.brown

func _on_Box_mouse_exited():
	mouse_entered = false
	modulate = Color.white

