extends HBoxContainer

@onready var kazakh: CheckBox = $Kazakh
@onready var english: CheckBox = $English
@onready var russian: CheckBox = $Russian

var lang_english := "en"
var lang_kazakh := "kk"
var lang_russian := "ru"

func _ready() -> void:
	if Global.first_time:
		language_check(Global.lang)
	else:
		language_set(Global.lang)


func language_check(language):
	match language:
		lang_english:
			kazakh.button_pressed = false
			russian.button_pressed = false
		lang_kazakh:
			english.button_pressed = false
			russian.button_pressed = false
		lang_russian:
			english.button_pressed = false
			kazakh.button_pressed = false


func language_set(language):
	if language == lang_english or language == lang_kazakh or language == lang_russian:
		Global.lang = language
		TranslationServer.set_locale(language)


func _on_kazakh_button_down() -> void:
	language_set(lang_kazakh)
	language_check(lang_kazakh)


func _on_english_button_down() -> void:
	language_set(lang_english)
	language_check(lang_english)


func _on_russian_button_down() -> void:
	language_set(lang_russian)
	language_check(lang_russian)
