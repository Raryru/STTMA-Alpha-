extends CharacterBody2D
class_name Characters

enum {
	DOWN,
	UP,
	LEFT,
	RIGHT
}

@onready var anim: AnimationPlayer = $AnimationCharacter

func _ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	pass

func Hitbox():
	pass

func control():
	pass
