class_name FighterSpriteManager extends Node

@export var fighter_sprite: Sprite2D
@export var active_texture: Texture
@export var inactive_texture: Texture

@warning_ignore("shadowed_variable")
func init_sprites(active_texture: Texture, inactive_texture: Texture):
	self.active_texture = active_texture
	self.inactive_texture = inactive_texture
	set_sprite_active()

func set_sprite_active() -> void:
	fighter_sprite.texture = active_texture

func set_sprite_inactive() -> void:
	fighter_sprite.texture = inactive_texture
