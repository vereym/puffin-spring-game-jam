extends Node2D


func _on_pool_area_body_entered(body: Node2D) -> void:
	SignalBus.player_entered_pool.emit()
