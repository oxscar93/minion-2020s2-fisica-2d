extends CanvasLayer

var constants = preload("res://Utils/Constants.gd")

signal new_game
signal restart_game
# Called when the node enters the scene tree for the first time.
func _ready():
	$RestartMessage.hide() # Replace with function body.

func _input(event):
	if (event.is_action_pressed(('ui_restart'))):
		restart_game()
		
func show_message_with_timer(text):
	show_message(text)
	$MessageTimer.start()	
	
func show_message(text):
	$Message.text = text
	$Message.show()	

func _new_game():
	$StartButton.hide()
	$Message.hide()
	$LegendMessage.hide()
	$RestartMessage.show()
	
	emit_signal("new_game")
	
func win_game():
	show_message_with_timer(constants.WIN_MESSAGE)
	yield($MessageTimer, "timeout")
	restart_game()
	
func restart_game():
	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	
	show_message(constants.GAME_TITLE)	
	get_tree().call_group("levels", "queue_free")
	
	emit_signal("restart_game")
	$RestartMessage.hide()
	$LegendMessage.show()
	$StartButton.show()


func _on_StartButton_pressed():
	_new_game()

func _on_Main_level_changed(level):
	show_message_with_timer(constants.LEVEL + str(level))

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_Main_game_finished():
	win_game()
	
