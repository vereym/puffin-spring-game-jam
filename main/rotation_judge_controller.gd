extends Marker2D


var amount_rotated := 0.0
var last_rotation := global_rotation

var turns := 0

# func _process(_delta):
# 	print(turns)

func _physics_process(_delta: float) -> void:
	amount_rotated += angle_difference(last_rotation, global_rotation)
	last_rotation = global_rotation
	if abs(amount_rotated) > 2 * PI:
		turns += 1
		amount_rotated = 0.0
