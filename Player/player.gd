class_name Player extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D



var speed := 150
var jump := 320.0
var movInput := Vector2.ZERO
const GRAVITY := 14

func _input(event: InputEvent) -> void:
	movInput.x = Input.get_axis("ui_left","ui_right")


func _process(delta: float) -> void:
	$Label.text = $StateMachine.state.name
	
