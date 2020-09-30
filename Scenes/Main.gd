extends Node

signal level_changed
signal game_finished

var current_level = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _start_level(levelName):
	var level = load("res://Scenes/" + str(levelName) + ".tscn")
	var instance = level.instance()
	
	instance.connect("on_level_passed", self, "_start_new_level")
	
	current_level+= 1
	
	add_child(instance)
	
func _start_new_level():
	$LevelTimer.start()

func _change_level():
	if (current_level > 4):
		_finish_game()
	else:	
		_next_level()
	
func _finish_game():
	emit_signal("game_finished")
	_reset_levels()

func _next_level():
	emit_signal("level_changed", current_level)
	_start_level("Level" + str(current_level))

func _reset_levels():
	current_level = 1
		
func _on_StartTimer_timeout():
	_change_level()

func _on_LevelTimer_timeout():
	 _change_level()
	
func _on_HUD_new_game():
	$StartTimer.start() 

func _on_HUD_restart_game():
	_reset_levels()
