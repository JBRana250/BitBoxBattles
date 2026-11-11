class_name ImageGalleryItem extends PanelContainer

@export var texture_rect: TextureRect
var gal: ImageGalleryPopup
var id: StaticTextures.ID
const scene_path: String = "res://fighter_creator/popups/image_gallery/image_gallery_item.tscn"

static func load_scene() -> PackedScene:
	return load(scene_path)

static func create(_id: StaticTextures.ID, gallery: ImageGalleryPopup, scene: PackedScene) -> ImageGalleryItem:
	var instance: ImageGalleryItem = scene.instantiate()
	var texture: Texture = StaticData.get_texture(_id)
	instance.texture_rect.texture = texture
	instance.gal = gallery
	instance.id = _id
	return instance

func _on_button_pressed() -> void:
	gal.on_gallery_item_pressed(id)
