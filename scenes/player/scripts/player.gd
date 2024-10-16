extends CharacterBody2D

@export var _speed := 0.0
@export var _damage := 0.0

var curr_direction := Vector2(1, 0)

var input_checker : InputChecker
var weapon : Weapon

signal attack(direction: Vector2)

func _ready() -> void:
	input_checker = FromUnity.find_node_in_children(self, InputChecker)
	
	weapon = FromUnity.find_node_in_children(self, Weapon)
	weapon.hide()

func _process(_delta: float) -> void: 
	if input_checker.get_direction() != Vector2.ZERO:
		curr_direction = input_checker.get_direction()
	
	if input_checker.is_attack(): 
		attack.emit(curr_direction)
		await get_tree().create_timer(weapon.anim_time).timeout
	else:
		velocity = input_checker.get_direction() * _speed
		move_and_slide()
