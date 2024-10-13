extends Node2D
class_name InputChecker

func get_direction() -> Vector2: return Input.get_vector("left", "right", "up", "down")
