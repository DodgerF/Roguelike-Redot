extends State
class_name PlayerIdle

func enter():
	animation_player.play("idle_forward")

func update(_delta: float):
	if Input.get_vector("left", "right", "up", "down") != Vector2(0, 0):
		state_transition.emit(self, StateName.WALK)

func exit():
	animation_player.stop()
