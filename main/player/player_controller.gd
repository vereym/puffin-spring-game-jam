extends RigidBody2D

var force = 10000
@onready var torso: RigidBody2D = $"."
@onready var lower_leg_2: RigidBody2D = $"../LowerLeg2"
@onready var wingtip_1: RigidBody2D = $"../Wingtip1"
@onready var wingtip_2: RigidBody2D = $"../Wingtip2"
@onready var lower_leg_1: RigidBody2D = $"../LowerLeg1"

@onready var center: Marker2D = $Center
@onready var up_left: Marker2D = $UpLeft
@onready var up_right: Marker2D = $UpRight
@onready var down_left: Marker2D = $DownLeft
@onready var down_right: Marker2D = $DownRight

var forceMulti = 2000

var upLeftActive = false
var upRightActive = false
var downLeftActive = false
var downRightActive = false

func _ready():
	can_sleep = false

func move(body: RigidBody2D, from: Marker2D, to: Marker2D) -> void:
	var force = (to.position - from.position).normalized() * forceMulti
	body.apply_central_impulse(force)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("p-key"):
		if !upRightActive:
			upRightActive = true
			move(wingtip_1, center, up_right)
	if event.is_action_released("p-key"):
		if upRightActive:
			upRightActive = false
			move(wingtip_1, up_right, center)
	if event.is_action_pressed("q-key"):
		if !upLeftActive:
			upLeftActive = true
			move(wingtip_2, center, up_left)
	if event.is_action_released("q-key"):
		if upLeftActive:
			upLeftActive = false
			move(wingtip_2, up_left, center)
			
	if event.is_action_pressed("o-key"):
		if !downRightActive:
			downRightActive = true
			move(lower_leg_1, center, down_right)
	if event.is_action_released("o-key"):
		if downRightActive:
			downRightActive = false
			move(lower_leg_1, down_right, center)
	if event.is_action_pressed("w-key"):
		if !downLeftActive:
			downLeftActive = true
			move(lower_leg_2, center, down_left)
	if event.is_action_released("w-key"):
		if downLeftActive:
			downLeftActive = false
			move(lower_leg_2, down_left, center)
