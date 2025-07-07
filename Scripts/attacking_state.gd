extends State

func enter():
	parent.animation_player.play("1H_Melee_Attack_Slice_Horizontal")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	changing_states.emit(self, "idle state")
	pass # Replace with function body.
