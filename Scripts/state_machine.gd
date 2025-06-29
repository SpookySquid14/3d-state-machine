extends Node

var current_state: State
@export var starting_state: State

# Called when the node enters the scene tree for the first time.
func init(parent: Node) -> void:
	for child in get_children():
		child.parent = parent
		print (str(child) + "is parented to" + str(child.parent))
	current_state = starting_state
	pass # Replace with function body.
	
func change_state(new_state: State):
	if current_state:
		print("Exiting "+str(current_state))
		current_state.exit()
	current_state = new_state
	current_state.enter()
	print("Entering "+str(current_state))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta: float) -> void:
	var new_state = current_state.process(delta)
	if new_state:
		change_state(new_state)
	pass
	
func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state:
		change_state(new_state)
	pass
	
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state:
		change_state(new_state)
	pass
