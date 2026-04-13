extends Node2D

var _player_entered_pool := false

func _ready():
	SignalBus.player_entered_pool.connect(_on_player_entered_pool)
	%Player/RotationJudge.reparent(%Player/Torso)
	%Player/Camera2D.reparent(%Player/Torso)


func _input(event):
	if event is InputEventKey and event.keycode == KEY_R:
		get_tree().reload_current_scene()


func _on_player_entered_pool():
	if _player_entered_pool:
		return
	_player_entered_pool = true
