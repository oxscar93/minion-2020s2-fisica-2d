extends KinematicBody2D

const RUN_SPEED = 100
const JUMP_SPEED = -170
const GRAVITY = 1200

var velocity = Vector2()
var jumping = false
var direction = Vector2()
	
func get_input():
	velocity.x = 0
	var right_pressed = Input.is_action_pressed('ui_right')
	var left_pressed = Input.is_action_pressed('ui_left')
	var jump_pressed = Input.is_action_just_pressed('ui_select')

	if jump_pressed and is_on_floor():
		jumping = true
		velocity.y = JUMP_SPEED
	if right_pressed:
		velocity.x += RUN_SPEED
		direction.x = 1
	if left_pressed:
		velocity.x -= RUN_SPEED
		direction.x = -1

func _physics_process(delta):
	get_input()
	
	velocity.y += GRAVITY * delta
	if jumping and is_on_floor():
		jumping = false
			
	velocity = move_and_slide(velocity, Vector2(0, -1))

func get_x_pos():
	return direction
	
