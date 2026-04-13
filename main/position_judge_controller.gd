extends Node


var _player_entered_pool := false
signal rating(distance)

func _ready() -> void:
	SignalBus.player_entered_pool.connect(_on_player_entered_pool)


func _polygon_get_rect(polygon: CollisionPolygon2D) -> Rect2:
	var min_ := Vector2.INF
	var max_ := -Vector2.INF
	for point in polygon.polygon:
		min_ = min_.min(point)
		max_ = max_.max(point)
	return Rect2(min_, max_ - min_)


func _on_player_entered_pool():
	if _player_entered_pool:
		return
	_player_entered_pool = true

	($Sprites as AnimatedSprite2D).frame = 1

	var player_pos: Vector2 = %Player.global_position
	var pool: CollisionPolygon2D = $"../Environment/Wasserganz/PoolArea/CollisionPolygon2D"
	var bounds := _polygon_get_rect(pool)
	var pool_midpoint := pool.global_transform * (bounds.position + bounds.size / 2)
	var diff = abs(player_pos.x - pool_midpoint.x)

	rating.emit(diff)
