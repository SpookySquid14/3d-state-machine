extends Node

var states: Dictionary = {}
var current_state: State
@export var initial_state: State

func init(parent: CharacterBody3D) -> void:
	for child in get_children():
		if child is State:
			child.parent = parent
			states[child.name.to_lower()] = child
			child.changing_states.connect(change_state)
			print(child, child.parent)
	print(states)
	current_state = states.get(initial_state.name.to_lower())
	print("The initial current state is: " + str(current_state))
	current_state.enter()
	pass
	
func input(event: InputEvent) -> void:
	current_state.input(event)
	pass

func process(delta: float) -> void:
	current_state.process(delta)
	pass

func physics_process(delta: float) -> void:
	current_state.physics_process(delta)
	pass	

func change_state(state, new_state):
	if state != current_state:
		return
	if new_state:
		current_state.exit()
		current_state = states[new_state]
		current_state.enter()
	pass
