extends KinematicBody2D

const RUN_SPEED = 100
const JUMP_SPEED = -170
const GRAVITY = 1200

var velocity = Vector2()
var jumping = false
var direction = Vector2(1,0)
	
func get_input():
	velocity.x = 0
	var right_pressed = Input.is_action_pressed('right')
	var left_pressed = Input.is_action_pressed('left')
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
			
	velocity = move_and_slide(velocity, Vector2(0, -1), false, 4, 0.785, false)

func _exec_jump():
	jumping = true
	velocity.y = JUMP_SPEED
	
func get_direction():
	return direction
	
func celebrate():
	_exec_jump()
	yield(get_tree().create_timer(0.5), "timeout")
	_exec_jump()
	yield(get_tree().create_timer(0.5), "timeout")
