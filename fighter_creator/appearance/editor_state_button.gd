extends TextureButton

@export var state_machine: SpriteEditorStateMachine
@export var state: SpriteEditorStateMachine.State

func _on_pressed() -> void:
	state_machine.set_state(state)
