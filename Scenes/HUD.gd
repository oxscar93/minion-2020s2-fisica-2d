extends CanvasLayer

var constants = preload("res://Utils/Constants.gd")

signal newGame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func show_message_with_timer(text):
	show_message(text)
	$MessageTimer.start()	
	
func show_message(text):
	$Message.text = text
	$Message.show()	
		
func restart_game():
	show_message_with_timer(constants.WIN_MESSAGE)
	# Wait until the MessageTimer has counted down.
	yield($MessageTimer, "timeout")

	# Make a one-shot timer and wait for it to finish.
	yield(get_tree().create_timer(1), "timeout")
	show_message(constants.GAME_TITLE)
	$StartButton.show()


func _on_StartButton_pressed():
	$StartButton.hide()
	$Message.hide()
	
	emit_signal("newGame") # Replace with function body.

func _on_Main_level_changed(level):
	show_message_with_timer(constants.LEVEL + str(level))

func _on_MessageTimer_timeout():
	$Message.hide() # Replace with function body.

func _on_Main_game_finished():
	restart_game()
	
