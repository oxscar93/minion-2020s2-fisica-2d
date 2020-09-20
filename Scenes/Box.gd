extends KinematicBody2D

const JUMP_SPEED = -200
const GRAVITY = 200

var velocity = Vector2()
var levitating = false
var x_pos =  0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):	
	if levitating and is_on_floor():
		velocity.y = JUMP_SPEED
		
	velocity.y += GRAVITY * delta
	velocity.x = x_pos
	
	if (levitating):
		velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if levitating and is_on_floor():
		levitating = false
		
		
func levitate(x_position):
	x_pos = x_position
	levitating = true

	
func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		levitate(body.get_x_pos().x * 100)
