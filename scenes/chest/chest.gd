extends Area2D
class_name Chest

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
