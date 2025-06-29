extends State
@export var walking_state: State


# Called when the node enters the scene tree for the first time.
func input(event: InputEvent) -> State:
	if event.is_action_pressed("Move_Up") or event.is_action_pressed("Move_Down") or event.is_action_pressed("Move_Left") or event.is_action_pressed("Move_Right"):
		return walking_state
	return self
