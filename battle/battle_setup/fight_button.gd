extends Button

@export var battle_setup_menu: Control
@export var fighter_one_button: Button
@export var fighter_two_button: Button
@export var curtain: Curtains

@export var stand_texture_rect: TextureRect
@export var button_texture_rect: TextureRect
@export var holder_texture_rect: TextureRect
@export var fight_button_anim_player: AnimationPlayer
@export var hover_flash_amount: float
@export var idle_flash_amount: float = 0

func _on_pressed() -> void:
	fight_button_anim_player.play("press")
	var fighter_one_profile: FighterProfile = fighter_one_button.get_fighter_profile()
	var fighter_two_profile: FighterProfile = fighter_two_button.get_fighter_profile()
	
	if (fighter_one_profile == null):
		return
	if (fighter_two_profile == null):
		return
	
	curtain.up_anim()
	await curtain.up_anim_finished
	curtain.open_anim()
	BattleEventBus.start_battle.emit(fighter_one_profile, fighter_two_profile)
	battle_setup_menu.visible = false

func _on_mouse_entered() -> void:
	set_hover_pulse(true)

func _on_mouse_exited() -> void:
	set_hover_pulse(false)
	
func set_hover_pulse(enabled: bool) -> void:
	var amount: float
	if enabled:
		amount = hover_flash_amount
	else:
		amount = idle_flash_amount
	
	stand_texture_rect.material.set_shader_parameter("flash_amount", amount)
	button_texture_rect.material.set_shader_parameter("flash_amount", amount)
	holder_texture_rect.material.set_shader_parameter("flash_amount", amount)
