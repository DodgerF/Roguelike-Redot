extends Area2D
class_name Weapon

const INDENTATION = 7
var collision: CollisionShape2D

func _ready() -> void:
	collision = FromUnity.find_node_in_children(self, CollisionShape2D)
	print(collision)
	collision.disabled = true

func attack(direction: Vector2) -> void:
	position = direction * INDENTATION
	rotation = atan2(direction.y, direction.x)
	
	show()
	collision.disabled = false

func stop_attack() -> void:
	hide()
	collision.disabled = true


#func _on_body_entered(body: Node2D) -> void:
	#if body is Chest:
		#body.queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Chest:
		area.queue_free()
