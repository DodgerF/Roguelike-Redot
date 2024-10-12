@tool
extends Node2D

@export var loading_scene: PackedScene
@export_range(0.0, 100.0, 0.1)
var radius := 10.0

@export_category("Timer Property")
@export_range(0.0, 100.0, 0.1)
var wait_time := 1
@export var one_shot := false
@export var autostart := false

func _process(delta):
	if Engine.is_editor_hint():
		queue_redraw()

func _draw() -> void:
	if Engine.is_editor_hint():
		draw_circle(Vector2.ZERO, radius, Color.FIREBRICK, false)
