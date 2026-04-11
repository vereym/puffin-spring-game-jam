extends CenterContainer
var game_scene = preload("res://main/main.tscn").instantiate()
@onready var settings_button: TextureButton = $"../MarginContainer/PanelContainer/VBoxContainer/Settings"
@onready var about_button: TextureButton = $"../MarginContainer/PanelContainer/VBoxContainer/About"
@onready var quit_button: TextureButton = $"../MarginContainer/PanelContainer/VBoxContainer/Quit"
@onready var start_button: TextureButton = $"../MarginContainer/PanelContainer/VBoxContainer/Start"
@onready var optionsContainer: MarginContainer = $"../Options"
@onready var music_slider: HSlider = $"../Options/VBoxContainer/MusicSlider"
@onready var sfx_slider: HSlider = $"../Options/VBoxContainer/SfxSlider"
@onready var clicks: AudioStreamPlayer2D = $"../Clicks"
@onready var aboutContainer: MarginContainer = $"../about"

var lastHighlight = 0

func _ready() -> void:
	pass
	
func highlightButton(button) -> void:
	lastHighlight = randi() % 3 + 1 # so it's between 1 and 3
	if lastHighlight == 1:
		button.scale *= 1.1
	elif lastHighlight == 2:
		button.rotation_degrees -= 10
	elif lastHighlight == 3:
		button.rotation_degrees += 10
	
func unhighlightButton(button) -> void:
	if lastHighlight == 0:
		pass
	elif lastHighlight == 1:
		button.scale /= 1.1
	elif lastHighlight == 2:
		button.rotation_degrees += 10
	elif lastHighlight == 3:
		button.rotation_degrees -= 10

func _on_start_pressed() -> void:
	clicks.play()
	await clicks.finished
	get_tree().change_scene_to_node(game_scene)


func _on_settings_pressed() -> void:
	clicks.play()
	optionsContainer.visible = !optionsContainer.visible


func _on_about_pressed() -> void:
	clicks.play()
	aboutContainer.visible = !aboutContainer.visible


func _on_quit_pressed() -> void:
	clicks.play()
	await clicks.finished
	get_tree().quit()


func _on_start_focus_entered() -> void:
	highlightButton(start_button)


func _on_start_focus_exited() -> void:
	unhighlightButton(start_button)


func _on_start_mouse_entered() -> void:
	_on_start_focus_entered()


func _on_start_mouse_exited() -> void:
	_on_start_focus_exited()


func _on_settings_focus_entered() -> void:
	highlightButton(settings_button)


func _on_settings_focus_exited() -> void:
	unhighlightButton(settings_button)


func _on_settings_mouse_entered() -> void:
	_on_settings_focus_entered()


func _on_settings_mouse_exited() -> void:
	_on_settings_focus_exited()


func _on_about_focus_entered() -> void:
	highlightButton(about_button)


func _on_about_focus_exited() -> void:
	unhighlightButton(about_button)


func _on_about_mouse_entered() -> void:
	_on_about_focus_entered()


func _on_about_mouse_exited() -> void:
	_on_about_focus_exited()


func _on_quit_focus_entered() -> void:
	highlightButton(quit_button)


func _on_quit_focus_exited() -> void:
	unhighlightButton(quit_button)


func _on_quit_mouse_entered() -> void:
	_on_quit_focus_entered()


func _on_quit_mouse_exited() -> void:
	_on_quit_focus_exited()


func _on_back_button_pressed() -> void:
	optionsContainer.visible = false
	clicks.play()


func _on_music_slider_value_changed(value: float) -> void:
	var idx =AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_linear(idx, value)


func _on_sfx_slider_value_changed(value: float) -> void:
	var idx =AudioServer.get_bus_index("Sfx")
	AudioServer.set_bus_volume_linear(idx, value)
	clicks.play()
	
