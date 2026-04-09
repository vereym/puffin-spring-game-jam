extends RigidBody2D

var force = 10000

func _ready():
	can_sleep = false

func _integrate_forces(state):
	if Input.is_action_pressed("left"):
		state.apply_force(Vector2.LEFT * force)
	elif Input.is_action_pressed("right"):
		state.apply_force(Vector2.RIGHT * force)

# func _physics_process(delta: float) -> void:
# 	$RightPinJoint2D.transform
