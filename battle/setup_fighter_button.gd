class_name FighterSetupButton extends Button

@export var fighter_menu: Control
@export var fighter_label: Label
@export var fighter_texture_rect: TextureRect
@export var anim_player: AnimationPlayer
@export var type: String

@onready var fighter_chosen: bool = false
@export var hover_flash_amount: float = 0.1
var idle_flash_amount: float = 0.0
var fighter_profile: FighterProfile

func _on_pressed() -> void:
	fighter_menu.open_fighter_menu(self)

func _on_mouse_entered() -> void:
	set_hover_pulse(true)

func _on_mouse_exited() -> void:
	set_hover_pulse(false)

func choose_fighter(profile: FighterProfile):
	fighter_label.text = profile.init_resource.fighter_id
	if profile.texture_resource.setup_image:
		fighter_texture_rect.texture = profile.texture_resource.setup_image
	else:
		fighter_texture_rect.texture = profile.texture_resource.active_image
	fighter_profile = profile
	play_ready_animation()

func get_fighter_profile() -> FighterProfile:
	return fighter_profile

func play_ready_animation() -> void:
	var anim_type: FighterInitResource.ReadyAnimType = fighter_profile.init_resource.ready_anim_type
	
	if anim_type == FighterInitResource.ReadyAnimType.EXCITED:
		anim_player.play("excited_ready_anim")
	if anim_type == FighterInitResource.ReadyAnimType.IDLE:
		anim_player.play("idle_ready_anim")

func play_setup_animation() -> void:
	anim_player.play("setup_intro_anim" + type)

func set_hover_pulse(enabled: bool) -> void:
	var amount: float
	if enabled:
		amount = hover_flash_amount
	else:
		amount = idle_flash_amount
	
	fighter_texture_rect.material.set_shader_parameter("flash_amount", amount)
