class_name Curtains extends Control

@export var curtains_animation_player: AnimationPlayer
signal up_anim_finished
signal close_anim_finished

func up_anim() -> void:
	curtains_animation_player.play("curtain_up_animation")

func open_anim() -> void:
	curtains_animation_player.play("curtain_open_animation")

func down_anim() -> void:
	curtains_animation_player.play("curtain_down_animation")

func close_anim() -> void:
	curtains_animation_player.play("curtain_close_animation")

func _on_curtain_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "curtain_up_animation":
		up_anim_finished.emit()
	if anim_name == "curtain_close_animation":
		close_anim_finished.emit()
