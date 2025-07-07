extends State

func input(event: InputEvent) -> void:
	var input_dir := Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down")
	var direction := (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		changing_states.emit(self,"walking state")
	if event.is_action_pressed("Attack"):
		changing_states.emit(self,"attacking state")

func enter():
	parent.animation_player.play("Idle_B")
