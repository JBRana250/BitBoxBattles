class_name FighterSpriteManager extends Node

@export_group("References")
@export var fighter_sprite: Sprite2D
@export var active_texture: Texture
@export var inactive_texture: Texture
@export var onhit_timer: Timer

@export_group("Properties")
@export var onhit_modulate: Color
@onready var default_modulate: Color = Color(1,1,1,1)

@warning_ignore("shadowed_variable")
func init_sprites(active_texture: Texture, inactive_texture: Texture):
	self.active_texture = active_texture
	self.inactive_texture = inactive_texture
	set_sprite_active()

func set_sprite_active() -> void:
	fighter_sprite.texture = active_texture

func set_sprite_inactive() -> void:
	fighter_sprite.texture = inactive_texture

func onhit_flash() -> void:
	fighter_sprite.modulate = onhit_modulate
	onhit_timer.start()

func _on_onhit_timer_timeout() -> void:
	fighter_sprite.modulate = default_modulate
