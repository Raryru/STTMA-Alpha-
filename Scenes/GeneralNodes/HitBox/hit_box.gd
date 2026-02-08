class_name HitBox extends Area2D

signal damaged( hurt_box : HurtBox )


func _ready():
	pass # Replace with function body.



func _process( _delta ):
	pass


func TakeDamage( hurt_box : HurtBox ) -> void:
	damaged.emit( hurt_box )
