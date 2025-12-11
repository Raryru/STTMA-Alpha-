extends Node

#Game Settings
var lang := "en"
var audio := 0.0
var music := 0.0
var fullscreen := true

#Game AutoLoad
var first_time := true
var level_state := 0
var player_position := Vector2(0.0, 0.0)
var camera_position
var stady := 0
var time := 0.1
var days_count := 0
var time_count := "day"
var resume := false

#Game Scenes
const FIRST_LEVEL = "res://Scenes/Levels/FirstLevel/first_level.tscn"
const MAIN_MENU = "res://Scenes/User Interface/Main Menu/main_menu.tscn"
