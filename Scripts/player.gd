extends CharacterBody3D
@onready var state_machine: Node = $"State Machine"


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.input(event)
