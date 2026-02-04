extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var levels: Panel = $Levels


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play(Global.music)
	main_buttons.visible = true
	options.visible = false
	levels.visible = false
	TranslationServer.set_locale(Global.lang)
	Global.first_time = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func back():
	options.visible = false
	levels.visible = false
	main_buttons.visible = true


func _on_play_pressed() -> void:
	print("Play pressed")
	main_buttons.visible = false
	options.visible = false
	levels.visible = true


func _on_settings_pressed() -> void:
	print("Settings pressed")
	main_buttons.visible = false
	levels.visible = false
	options.visible = true


func _on_exit_pressed() -> void:
	print("Exit pressed")
	get_tree().quit()


func _on_back_settings_pressed() -> void:
	print("Settings Back pressed")
	back()


func _on_back_levels_pressed() -> void:
	print("Levels Back pressed")
	back()


func _on_select_first_level_pressed() -> void:
	print("First Level selected")
	Global.music = audio_stream_player.get_playback_position()
	get_tree().change_scene_to_file(Global.FIRST_LEVEL)
