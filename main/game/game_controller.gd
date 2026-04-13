extends Node2D


func _ready():
	%Player/RotationJudge.reparent(%Player/Torso)
