class_name FighterSetupButton extends Button

@export var fighter_menu: Control
@export var fighter_label: Label
@export var fighter_texture_rect: TextureRect
@export var anim_player: AnimationPlayer
@export var display_anim_player: AnimationPlayer
@export var battle_setup_bg: BattleSetupBG
@export var type: String

@onready var fighter_chosen: bool = false
@export var hover_flash_amount: float = 0.1
var idle_flash_amount: float = 0.0
var fighter_profile: FighterProfile

func get_fighter_profile() -> FighterProfile:
	return fighter_profile

func _on_pressed() -> void:
	fighter_menu.open_fighter_menu(self)

func _on_mouse_entered() -> void:
	set_hover_pulse(true)

func _on_mouse_exited() -> void:
	set_hover_pulse(false)

func choose_fighter(profile: FighterProfile):
	change_display_name(profile)
	await play_fighter_change_animation(profile)
	play_setup_animation(profile)
	
	if fighter_chosen:
		return
	
	if type == "A":
		battle_setup_bg.play_blue_bg()
	else:
		battle_setup_bg.play_red_bg()
	
	fighter_chosen = true

func play_fighter_change_animation(profile: FighterProfile) -> void:
	anim_player.play_backwards("setup_intro_anim" + type)
	await anim_player.animation_finished
	
	if profile.texture_resource.setup_image:
		fighter_texture_rect.texture = profile.texture_resource.setup_image
	else:
		fighter_texture_rect.texture = profile.texture_resource.active_image
	fighter_profile = profile
	
	anim_player.play("setup_intro_anim" + type)
	await anim_player.animation_finished

func change_display_name(profile: FighterProfile) -> void:
	display_anim_player.play("display_to_static")
	await display_anim_player.animation_finished
	fighter_label.text = profile.init_resource.fighter_id
	display_anim_player.play("static_to_display")


func play_setup_animation(profile: FighterProfile) -> void:
	var anim_type: FighterInitResource.SetupAnimType = profile.init_resource.setup_anim_type

	if anim_type == FighterInitResource.SetupAnimType.EXCITED:
		anim_player.play("excited_setup_anim")
	if anim_type == FighterInitResource.SetupAnimType.IDLE:
		anim_player.play("idle_setup_anim")

func play_intro_animation() -> void:
	anim_player.play("setup_intro_anim" + type)

func set_hover_pulse(enabled: bool) -> void:
	var amount: float
	if enabled:
		amount = hover_flash_amount
	else:
		amount = idle_flash_amount
	
	fighter_texture_rect.material.set_shader_parameter("flash_amount", amount)
