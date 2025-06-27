extends PlayerState

func enter(previous_state_path : String, data := {}):
	pass

func physics_update(_delta:float):
	if player.is_on_floor():
		emit_signal("finished","Idle")
	else:
		player.velocity.y += Player.GRAVITY
	
	player.move_and_slide()

func update(_delta:float):
	pass

func handle_input(_event : InputEvent):
	pass

func exit():
	pass
