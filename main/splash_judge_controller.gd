extends Node


var _player_entered_pool := false


func _ready():
	SignalBus.player_entered_pool.connect(_on_player_entered_pool)


func get_x_bounds(node: Node2D) -> Vector2:
	var x_values: Array = node\
		.find_children("*", "CollisionShape2D")\
		.reduce(func (acc, cs: CollisionShape2D):
			var rect = cs.shape.get_rect()
			return acc + [
				(cs.global_transform * rect.position).x,
				(cs.global_transform * (rect.position + Vector2(rect.size.x, 0))).x,
			], [])

	return Vector2(x_values.min(), x_values.max())


func _on_player_entered_pool():
	if _player_entered_pool:
		return
	_player_entered_pool = true

	print("enterd")
