extends Marker2D


var amount_rotated := 0.0
var last_rotation := global_rotation

var _player_entered_pool := false
signal rating(rotations)

var turns := 0

func _ready():
	SignalBus.player_entered_pool.connect(_on_player_entered_pool)

func _physics_process(_delta: float) -> void:
	amount_rotated += angle_difference(last_rotation, global_rotation)
	last_rotation = global_rotation
	if abs(amount_rotated) > 2 * PI:
		turns += 1
		amount_rotated = 0.0


func _on_player_entered_pool():
	if _player_entered_pool:
		return
	_player_entered_pool = true

	($Visual/Sprites as AnimatedSprite2D).frame = 1

	rating.emit(turns)
