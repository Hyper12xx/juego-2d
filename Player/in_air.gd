extends PlayerState

@onready var coyote_timer: Timer = $CoyoteTimer

var isJumping := false
var canReadJumpCoyote := false
var jumpCount := 0

func enter(previous_state_path : String, data := {}):
	isJumping = false
	canReadJumpCoyote = false
	player.animated_sprite_2d.play("Jump")
	
	if data.has("Jump") and jumpCount < 2:
		jumpCount+=1
		jumpCount - clamp(jumpCount,0,2)
		
		
		isJumping = true
		player.velocity.y = 0
		player.velocity.y = -player.jump
		
		if jumpCount > 1:
			player.animated_sprite_2d.play("Jump")
	else:
		coyote_timer.start()
		canReadJumpCoyote = true

func physics_update(_delta:float):
	if player.is_on_floor():
		jumpCount = 0
		emit_signal("finished","Idle")
	else:
		player.velocity.y += Player.GRAVITY
	
	if player.movInput.x != 0:
		player.velocity.x = player.movInput.x * player.speed
		
		
	player.move_and_slide()

func update(_delta:float):
	if player.movInput.x != 0:
		player.animated_sprite_2d.flip_h = player.movInput.x < 0

func handle_input(_event : InputEvent):
	if Input.is_action_just_pressed("ui_accept"):
		if player.is_on_floor():
			emit_signal("finished", "InAir", {"Jump": true})
		elif canReadJumpCoyote and player.velocity.y > 0:
			emit_signal("finished", "InAir", {"Jump": true})
		elif jumpCount <= 1:
			emit_signal("finished", "InAir", {"Jump": true})
		else:
			$JumppBufferTImer.start()

func exit():
	pass


func _on_coyote_timer_timeout() -> void:
	canReadJumpCoyote = false


func _on_jumpp_buffer_t_imer_timeout() -> void:
	if $"..".state.name == "Idle" or $"..".state.name == "Walking":
		emit_signal("finished","InAir", {"Jump" : true})
