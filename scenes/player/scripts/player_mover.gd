extends CharacterBody2D

var sprite: Node

var direction: Vector2
@export var speed: float = 200



func _ready() -> void:
	sprite = FromUnity.find_node_in_children(self, Sprite2D)


func _process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
