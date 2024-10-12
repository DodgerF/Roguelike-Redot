extends Node2D

var parent
func _ready() -> void:
	parent = get_parent()
	
	var timer: Timer = FromUnity.find_node_in_children(parent, Timer)
	if parent.autostart: timer.start()
	timer.wait_time = parent.wait_time
	timer.one_shot = parent.one_shot


var self_x = position.x
var self_y = position.y
func _on_timer_timeout() -> void: 
	var instance = load(parent.loading_scene.resource_path).instantiate()
	
	var rand := RandomNumberGenerator.new()
	var random_x = rand.randf_range(self_x, self_x + parent.radius)
	var random_y = rand.randf_range(self_y, self_y + parent.radius)
	
	instance.position = Vector2(random_x, random_y)
	add_child(instance)
