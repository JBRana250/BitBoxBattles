class_name ImageGalleryItem extends PanelContainer

@export var texture_rect: TextureRect
var gal: ImageGalleryPopup
var id: StaticTextures.ID
const SCENE_PATH: String = "res://fighter_creator/popups/image_gallery/image_gallery_item.tscn"
const SELECTED_COLOR = Color.AQUAMARINE
const DEFAULT_COLOR = Color.WHITE

enum State {
	NORMAL,
	HOVER,
	SELECTED
}

const amount = {
	State.NORMAL : 0.0,
	State.HOVER : 0.25,
	State.SELECTED : 0.35
}

var current_state: State:
	set(value):
		if (value == State.HOVER) and current_state == State.SELECTED:
			return
		current_state = value
		if value == State.SELECTED:
			texture_rect.material.set_shader_parameter("flash_color", SELECTED_COLOR)
			texture_rect.material.set_shader_parameter("pattern", 0)
			set_hover_pulse(amount[value])
		else:
			texture_rect.material.set_shader_parameter("flash_color", DEFAULT_COLOR)
			texture_rect.material.set_shader_parameter("pattern", 5)
			set_hover_pulse(amount[value])

static func load_scene() -> PackedScene:
	return load(SCENE_PATH)

static func create(_id: StaticTextures.ID, gallery: ImageGalleryPopup, scene: PackedScene, selected: bool) -> ImageGalleryItem:
	var instance: ImageGalleryItem = scene.instantiate()
	var texture: Texture = StaticData.get_texture(_id)
	instance.texture_rect.texture = texture
	instance.gal = gallery
	instance.id = _id
	
	if selected:
		instance.current_state = State.SELECTED
	
	return instance

func _ready() -> void:
	gal.item_selected.connect(_on_item_selected)

func _on_button_pressed() -> void:
	gal.on_gallery_item_pressed(id, self)
	current_state = State.SELECTED

func _on_button_mouse_entered() -> void:
	current_state = State.HOVER

func _on_button_mouse_exited() -> void:
	if current_state == State.SELECTED:
		return
	current_state = State.NORMAL

func _on_item_selected(item: ImageGalleryItem) -> void:
	if item == self:
		return
	current_state = State.NORMAL

func set_hover_pulse(val) -> void:
	texture_rect.material.set_shader_parameter("flash_amount", val)
