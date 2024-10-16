extends Node
class_name State

enum StateName {
	IDLE,
	ATTACK,
	WALK,
}

@export var state_name : StateName

var animation_player : AnimationPlayer
signal state_transition


func enter():
	pass

func exit():
	pass

func update(_delta: float):
	pass
