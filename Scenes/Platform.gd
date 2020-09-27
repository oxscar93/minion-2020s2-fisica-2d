extends RigidBody2D

signal on_platform_movement
var body_entered = false

func _ready():
	pass # Replace with function body.

func _physics_process(delta):	
	if (body_entered):
		emit_signal("on_platform_movement")						
			
func move_platform(vector):
	set_axis_velocity(Vector2(0, -vector.y))

	
func _on_Platform_body_entered(body):
	body_entered = true # Replace with function body.
