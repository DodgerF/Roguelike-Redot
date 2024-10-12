extends Node2D

@export var loading_scene: PackedScene
@export_range(0.0, 1000.0, 0.1)
var radius := 10.0

@export_category("Timer Property")
@export_range(0.0, 100.0, 0.1)
var wait_time := 1
@export var one_shot := false
@export var autostart := false

func _ready() -> void:
	var timer: Timer = FromUnity.find_node_in_children(self, Timer)
	if autostart: timer.start()
	timer.wait_time = wait_time
	timer.one_shot = one_shot


var self_x = position.x
var self_y = position.y
func _on_timer_timeout() -> void: 
	var instance = load(loading_scene.resource_path).instantiate()
	
	var rand := RandomNumberGenerator.new()
	var random_x = rand.randf_range(self_x, self_x + radius)
	var random_y = rand.randf_range(self_y, self_y + radius)
	
	instance.position = Vector2(random_x, random_y)
	add_child(instance)
