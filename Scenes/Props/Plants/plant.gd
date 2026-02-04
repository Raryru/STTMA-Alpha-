class_name Plant extends Node2D

@onready var animation_player = $AnimationPlayer
@onready var static_body_2d = $StaticBody2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D

var invulnerable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("idle")
	$HitBox.Damaged.connect( TakeDamage )
	pass # Replace with function body.


func TakeDamage( _damage : int ) -> void:
	#if !invulnerable:
		#animation_player.play("death")
		#collision_shape_2d.disabled = true
		#get_tree().create_timer( animation_player.current_animation_length ).timeout
	queue_free()
	pass
