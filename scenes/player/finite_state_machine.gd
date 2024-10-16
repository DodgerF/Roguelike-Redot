extends Node
class_name FinitedStateMachine

var states : Dictionary = {}
@export var initial_state : State.StateName
@export var anim_player : AnimationPlayer

var current_state : State

func _ready() -> void:
	if !anim_player:
		anim_player = FromUnity.find_node_in_children(get_parent(), AnimationPlayer)
	
	for child in get_children():
		if child is State:
			states[child.state_name] = child
			child.state_transition.connect(on_change_state)
			child.animation_player = anim_player
	
	if states[initial_state]:
		current_state = states[initial_state]
		current_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _exit_tree() -> void:
	for child in get_children():
		if child is State:
			states[child.state_name] = child
			child.state_transition.disconnect(on_change_state)

func on_change_state(source_state : State, new_state_name : State.StateName):
	if source_state != current_state:
		print("Invalid on_change_state trying from: " + source_state.name 
		+ " but currently in: " + current_state.name)
		return
	
	var new_state = states.get(new_state_name)
	if !new_state:
		print("New state is empty")
		return
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	current_state = new_state


func force_on_change_state(new_state_name : State.StateName):
	var new_state : State = states.get(new_state_name)
	
	if !new_state:
		print(str(new_state_name) + " doesn't exist in the dictionary of states")
		return
	
	if current_state == new_state:
		print("State is same, aborting")
		return
	
	if current_state:
		var exit_callable = Callable(current_state, "exit")
		exit_callable.call_deferred()
	
	new_state.enter()
	current_state = new_state
