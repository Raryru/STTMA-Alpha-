class_name Plant extends Node2D

@onready var anim = $AnimationPlayer
@onready var collission = $StaticBody2D
@onready var collision_shape_2d = $StaticBody2D/CollisionShape2D
@onready var hit_box = $HitBox
@onready var sprite_2d = $Sprite2D

@export var variant : int

const variant_quantity : int = 3

var invulnerable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	variant = randi_range(1, variant_quantity)
	anim.play("idle_" + str(variant))
	$HitBox.damaged.connect( TakeDamage )
	pass # Replace with function body.


func TakeDamage( hurt_box : HurtBox ) -> void:
	if !invulnerable:
		anim.play("death_" + str(variant))
		invulnerable = true
		hit_box.queue_free()
		get_tree().create_timer( anim.current_animation_length ).timeout
		
	pass
