extends Node


func _input(event):
	if event is InputEventKey and event.keycode == KEY_R:
		get_tree().reload_current_scene()
