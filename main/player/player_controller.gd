extends RigidBody2D

var force = 10000
@onready var torso: RigidBody2D = $"."

func _ready():
	can_sleep = false

func _integrate_forces(state):
	if Input.is_action_pressed("left"):
		state.apply_force(Vector2.LEFT * force)
	elif Input.is_action_pressed("right"):
		state.apply_force(Vector2.RIGHT * force)

# func _physics_process(delta: float) -> void:
# 	$RightPinJoint2D.transform

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("q-key"):
		torso.apply_torque(1000000)
		print("q was pressed")
	elif Input.is_action_just_pressed("p-key"):
		torso.apply_torque(-1000000)
