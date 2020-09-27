extends RigidBody2D

signal on_platform_falling

const MAX_PLATFORM_DOWN_LIMIT = 500
const MAX_PLATFORM_UP_LIMIT = 400
const FORCE_APPLIED = -10

var x= 0
var platform_falling = false
var platform_elevating = false
var in_motion = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):

	var y = global_position.y 
	var velocity = linear_velocity.y
	
	if (platform_falling):
		mode = RigidBody2D.MODE_CHARACTER
		emit_signal("on_platform_falling")		
		
		if (in_motion):
			x+=1
			add_force(Vector2(0, 0), Vector2(0, FORCE_APPLIED))
	
		if (velocity == 0 and !in_motion):
			in_motion = true
		elif ((velocity < -0 or y >= MAX_PLATFORM_DOWN_LIMIT) and in_motion):	
			mode = RigidBody2D.MODE_STATIC
			in_motion = false
			platform_falling = false
	
			x = 0
		elif (y < 350 and !in_motion):
			mode = RigidBody2D.MODE_STATIC
			
	if (platform_elevating):
		if (y <= MAX_PLATFORM_UP_LIMIT):	
			mode = RigidBody2D.MODE_STATIC
			
func elevate_platform(vector):
	linear_velocity
	mode = RigidBody2D.MODE_CHARACTER
	set_axis_velocity(Vector2(0, -vector.y))
	platform_elevating = true


func down_platform(body):
	if ("Box" in body.get_name()):
		platform_falling = true
		
func _on_Area2D_body_entered(body):
	down_platform(body)

func _on_Area2D_body_exited(body):
	down_platform(body)
