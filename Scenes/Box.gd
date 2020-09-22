extends KinematicBody2D

const LEVITATION_SPEED = -200
const GRAVITY = 200
const MAX_HEIGHT = 30
const X_BOX_DIRECTION = 300
const MIN_PLAYER_DISTANCE = 130

var velocity = Vector2()
var levitating = false
var x_pos =  0
var player
var mouse_entered = false

func _ready():
	player = get_parent().get_node('Player') #inyectar player	

func get_input():
	if (Input.is_action_pressed("click") and mouse_entered):
		levitate()
				
func _physics_process(delta):	
	get_input()

	velocity.y += GRAVITY * delta
	
	if levitating and is_on_floor():
		velocity.y = LEVITATION_SPEED
				
	if (levitating):		
		velocity = move_and_slide(velocity, Vector2(0, -1))
		
	if (velocity.y > MAX_HEIGHT and !is_on_floor()):
		velocity.x = x_pos
		velocity = move_and_slide(velocity, Vector2(0, -1))
		levitating = false
			
		
func levitate():
	var distance = player.global_position.distance_to(position)
	
	if (distance < MIN_PLAYER_DISTANCE):
		x_pos = player.get_direction().x * X_BOX_DIRECTION
		levitating = true
		

func _on_Box_mouse_entered():
	mouse_entered = true
	modulate = Color.brown
	

func _on_Box_mouse_exited():
	mouse_entered = false
	modulate = Color.white
