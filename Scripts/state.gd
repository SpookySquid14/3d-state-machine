extends Node
class_name State

var parent
# Called when the node enters the scene tree for the first time.
func enter() -> void:
	print("Entering "+ str(self))
	pass # Replace with function body.
	
func exit() -> void:
	print("Exiting "+ str(self))
	pass

func input(event: InputEvent) -> State:
	return null

func physics_process(delta: float) -> State:
	return null
# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta: float) -> State:
	return null
