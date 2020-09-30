extends Area2D

signal on_level_passed

var is_player_in_transport = false
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var enter_pressed = Input.is_action_pressed("ui_accept")

	if enter_pressed and is_player_in_transport:
		player.celebrate()
		yield(get_tree().create_timer(1), "timeout")
		emit_signal("on_level_passed")
		is_player_in_transport = false


func _physics_process(delta):
	get_input()
			

func _on_Transporter_body_entered(body):
	if (body.get_name() == "Player"):
		is_player_in_transport = true
		player = body


func _on_Transporter_body_exited(body):
	if (body.get_name() == "Player"):
		is_player_in_transport = false
		player = null
