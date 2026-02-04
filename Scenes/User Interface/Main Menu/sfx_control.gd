extends HSlider

@export var audio_bus_name: String

var audio_bus_id
var db

func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	if Global.first_time:
		AudioServer.set_bus_volume_db(audio_bus_id, -20.0)


func _on_value_changed(value: float) -> void:
	print("SFX db: ", value)
	db = linear_to_db(value)
	AudioServer.set_bus_volume_db(audio_bus_id, db)
