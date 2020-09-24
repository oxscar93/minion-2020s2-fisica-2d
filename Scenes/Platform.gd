extends RigidBody2D

var box_entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	add_force(Vector2(), Vector2(0, -500)) # Replace with function body.

func _physics_process(delta):
	if (box_entered):
		mode = RigidBody2D.MODE_RIGID
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Platform_body_entered(body):
	if ("Box" in body.get_name()):
		box_entered = true
