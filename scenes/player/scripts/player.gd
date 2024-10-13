extends CharacterBody2D

@export var _speed := 200.0

var input_checker : InputChecker

func _ready() -> void:
	input_checker = FromUnity.find_node_in_children(self, InputChecker)

func _physics_process(delta: float) -> void: 
	velocity = input_checker.get_direction() * _speed
	move_and_slide()
