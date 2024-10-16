extends State

func enter():
	animation_player.play("walk_down")

func update(_delta: float):
	if Input.get_vector("left", "right", "up", "down") == Vector2(0, 0):
		state_transition.emit(self, StateName.IDLE)

func exit():
	animation_player.stop()
