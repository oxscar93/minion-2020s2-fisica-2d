extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Platform_on_platform_falling():
	$Platform2.elevate_platform($Platform.linear_velocity)


func _on_Platform2_on_platform_falling():
	$Platform.elevate_platform($Platform2.linear_velocity)
