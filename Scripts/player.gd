extends CharacterBody3D
class_name Player
@onready var state_machine: Node = $"State Machine"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var rig: Node3D = $Rig

var hp: int = 300

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	
func _process(delta: float) -> void:
	state_machine.process(delta)
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.input(event)
