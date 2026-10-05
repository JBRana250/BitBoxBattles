extends TextureButton

enum FighterSpriteType {
	ACTIVE,
	INACTIVE
}

@export var file_dialog: FileDialog
@export var fighter_sprite_type: FighterSpriteType

func _on_pressed() -> void:
	file_dialog.visible = true
