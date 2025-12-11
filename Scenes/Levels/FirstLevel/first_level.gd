extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_stream_player.play(Global.music)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("menu"):
		Global.music = audio_stream_player.get_playback_position()
		get_tree().change_scene_to_file("res://Scenes/User Interface/Main Menu/main_menu.tscn")
