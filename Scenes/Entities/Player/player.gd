class_name Player extends CharacterBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D
@onready var state_machine : PlayerStateMachine = $StateMachine

signal DirectionChanged( new_direction: Vector2)

const DIR_4 = [ Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP ]
var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO


func _ready():
	state_machine.Initialize(self)
	pass



func _process( delta ):
	direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()
	#direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	#direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	
	pass

func _physics_process( delta ):
	move_and_slide()
	pass


func SetDirection() -> bool:
	if direction == Vector2.ZERO:
		return false
	
	var direction_id : int = int( round( ( direction  + cardinal_direction * 0.1 ).angle() /TAU * DIR_4.size() ) )
	var new_dir = DIR_4[ direction_id ]
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	DirectionChanged.emit( new_dir )
	return true


func UpdateAnimation( state : String ) -> void:
	animation_player.play( state + "_" + AnimDirection() )
	
	pass


func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.RIGHT:
		return "right"
	elif cardinal_direction == Vector2.LEFT:
		return "left"
	else:
		return ""
