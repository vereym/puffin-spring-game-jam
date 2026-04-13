extends Node

@onready var rotation_judge := $"../Player/RotationJudge"
@onready var position_judge := $"../PositionJudge"
@onready var splash_judge := $"../SplashJudge"

var turns_ := 0
var distance_ := INF
var splash_ := 0

func _ready() -> void:
	rotation_judge.rating.connect(func (turns): turns_ = turns * 10)
	position_judge.rating.connect(func (diff): distance_ = diff)
	splash_judge.rating.connect(func (span): splash_ = span)
