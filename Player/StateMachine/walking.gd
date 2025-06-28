extends PlayerState

func enter(previous_state_path : String, data := {}):
	player.animated_sprite_2d.play("Walking")

func physics_update(_delta:float):
	if !player.is_on_floor():
		emit_signal("finished","InAir")
	if player.movInput.x == 0:
		emit_signal("finished","Idle")
		if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
			emit_signal("finished","InAir", {"Jump" : true})
	player.velocity.x = lerpf(player.velocity.x, player.movInput.x * player.speed , .9)
	player.move_and_slide()

func update(_delta:float):
	if player.movInput.x != 0:
		player.animated_sprite_2d.flip_h = player.movInput.x < 0

func handle_input(_event : InputEvent):
	pass

func exit():
	pass
 
