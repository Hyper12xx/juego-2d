class_name State extends Node

signal finished(next_state_path : String, data : Dictionary)

func enter(previous_state_path : String, data := {}):
	pass

func physics_update(_delta:float):
	pass

func update(_delta:float):
	pass

func handle_input(_event : InputEvent):
	pass

func exit():
	pass
