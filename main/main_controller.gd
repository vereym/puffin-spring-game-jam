extends Node

func _ready():
	$Player/Marker2D.reparent($Player/Torso)


func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey and event.keycode == KEY_R:
		get_tree().reload_current_scene()
