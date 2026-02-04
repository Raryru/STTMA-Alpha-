class_name EnemyState extends Node

##Stores a reference to the enemy that this state belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine


## What happens when we initialize this State?
func init() -> void:
	pass


## What happens when the enemy enters this State?
func enter() -> void:
	pass


## What happens when the enemy exits this State?
func exit() -> void:
	pass


## What happens when the _process update this State?
func process( _delta : float ) -> EnemyState:
	return null


## What happens when the _physics_process update this State?
func physics( _delta : float ) -> EnemyState:
	return null
