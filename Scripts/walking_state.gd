extends State
@export var idle_state: State
const SPEED = 500

func physics_process(delta: float) -> State:
	var input_dir = Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down")
	var direction = (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * delta * SPEED
		parent.velocity.y = direction.y * delta * SPEED
	else:
		return idle_state
	parent.move_and_slide()
	return self
