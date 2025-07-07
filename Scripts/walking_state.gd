extends State

const SPEED = 5

func enter():
	parent.animation_player.play("Walking_A")
	parent.animation_player.play("Walking")

func physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("Move_Left","Move_Right","Move_Up","Move_Down")
	var direction := (parent.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.rig.look_at(parent.position - direction)
		parent.velocity.x = direction.x * SPEED
		parent.velocity.z = direction.z * SPEED
		print(parent.global_position)
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, SPEED)
		parent.velocity.z = move_toward(parent.velocity.z, 0, SPEED)
		changing_states.emit(self, "idle state")
	parent.move_and_slide()
	pass
