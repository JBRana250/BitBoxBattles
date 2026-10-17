class_name FighterSpriteManager extends Node

@export_group("References")
@export var fighter_sprite: Sprite2D
@export var active_texture: Texture
@export var inactive_texture: Texture

@warning_ignore("shadowed_variable")
func init_sprites(active_texture: Texture, inactive_texture: Texture):
	self.active_texture = active_texture
	self.inactive_texture = inactive_texture
	fighter_sprite.material.set_shader_parameter("progress", 1.0)
	set_sprite_active()

func set_sprite_active() -> void:
	fighter_sprite.texture = active_texture

func set_sprite_inactive() -> void:
	fighter_sprite.texture = inactive_texture

func onhit_flash(duration: float = 0.25) -> void:
	fighter_sprite.material.set_shader_parameter("pattern", 1)
	fighter_sprite.material.set_shader_parameter("progress", 0)
	var tween = create_tween()
	tween.tween_method(set_flash_progress, 0.0, 1, duration)

func set_flash_progress(val: float) -> void:
	fighter_sprite.material.set_shader_parameter("progress", val)
