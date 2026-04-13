extends Node2D
const NUM_0 = preload("uid://btwx78erd85er")
const NUM_1 = preload("uid://ciksssqwcmm86")
const NUM_2 = preload("uid://dy5aagwanvayg")
const NUM_3 = preload("uid://dwib36jdk6k73")
const NUM_4 = preload("uid://7xxgi16aaii7")
const NUM_5 = preload("uid://dnwukrlm5vapa")
const NUM_6 = preload("uid://gcgbhtrq6hlj")
const NUM_7 = preload("uid://c8npc7lbhb6bq")
const NUM_8 = preload("uid://xr17el2k20fi")
const NUM_9 = preload("uid://b15ady6pw3a83")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	signal_number(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func signal_number(prefix: int) -> void:
	if prefix < 10 and prefix >= 0:
		match prefix:
			0:
				$prefix_part.texture = NUM_0
			1:
				$prefix_part.texture = NUM_1
			2:
				$prefix_part.texture = NUM_2
			3:
				$prefix_part.texture = NUM_3
			4:
				$prefix_part.texture = NUM_4
			5:
				$prefix_part.texture = NUM_5
			6:
				$prefix_part.texture = NUM_6
			7:
				$prefix_part.texture = NUM_7
			8:
				$prefix_part.texture = NUM_8
			9:
				$prefix_part.texture = NUM_9
			
