class_name Plant extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var collission = $StaticBody2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@onready var hit_box = $HitBox

var invulnerable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")
	$HitBox.damaged.connect( TakeDamage )
	pass # Replace with function body.


func TakeDamage( hurt_box : HurtBox ) -> void:
	if !invulnerable:
		animation_player.play("death")
		invulnerable = true
		hit_box.queue_free()
		get_tree().create_timer( animation_player.current_animation_length ).timeout
		
	pass
