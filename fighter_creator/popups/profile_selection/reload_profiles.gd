extends Button

@export var fighter_profiles: FighterProfiles
@export var profile_selection_popup: Control

func _on_pressed() -> void: 
	profile_selection_popup.init_profile_selection()
