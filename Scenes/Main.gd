extends Node

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
	_start_level("Level" + str(current_level))
	
func _on_StartTimer_timeout():
	_change_level()

func _on_LevelTimer_timeout():
	 _change_level()
