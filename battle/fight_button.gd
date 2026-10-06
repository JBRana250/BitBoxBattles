extends Button

@export var battle_setup_menu: Control
@export var fighter_one_button: TextureButton
@export var fighter_two_button: TextureButton

func _on_pressed() -> void:
	var fighter_one_profile: FighterProfile = fighter_one_button.get_fighter_profile()
	var fighter_two_profile: FighterProfile = fighter_two_button.get_fighter_profile()
	
	if (fighter_one_profile == null):
		return
	if (fighter_two_profile == null):
		return
	
	
	BattleEventBus.start_battle.emit(fighter_one_profile, fighter_two_profile)
	battle_setup_menu.visible = false
