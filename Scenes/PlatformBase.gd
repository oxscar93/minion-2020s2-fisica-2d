extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _move_chain():
	$Chain.play()
	$Chain2.play()
	$Chain3.play()
	$Chain4.play()
	$Chain5.play()
	$Chain6.play()
	$Chain7.play()
	$Chain8.play()
	$Chain9.play()

func _on_Platform_on_platform_movement():
	$Platform2.move_platform($Platform.linear_velocity)
	_move_chain()

func _on_Platform2_on_platform_movement():
	$Platform.move_platform($Platform2.linear_velocity)
	_move_chain()
