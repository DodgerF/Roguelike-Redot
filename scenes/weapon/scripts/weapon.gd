extends Area2D
class_name Weapon

const INDENTATION = 7
var anim_time := 0.3
var collision: CollisionShape2D

func _ready() -> void:
	collision = FromUnity.find_node_in_children(self, CollisionShape2D)
	collision.disabled = true
	
	get_parent().attack.connect(attack)

func _exit_tree() -> void:
	get_parent().attack.disconnect(attack)

func attack(direction: Vector2) -> void:
	position = direction * INDENTATION
	rotation = atan2(direction.y, direction.x)
	
	show()
	collision.disabled = false
	
	await get_tree().create_timer(anim_time).timeout
	hide()
	collision.disabled = true


func _on_area_entered(area: Area2D) -> void:
	if area is Chest:
		area.queue_free()
