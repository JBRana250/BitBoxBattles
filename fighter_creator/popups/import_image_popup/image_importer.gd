@tool
class_name ImageImporter extends Importer

@export var owner_node: CompositeGraphNode
@export var label: Label
@export var thumbnail_button: TextureButton
var ptr: TexturePointer = TexturePointer.new(StaticTextures.ID.GODOT, TexturePointer.Type.STATIC)

@export var label_text: String:
	set(val):
		label_text = val
		apply_text()

func _ready():
	apply_text()

func apply_text():
	if not is_node_ready():
		return
	label.text = label_text

func _on_texture_button_pressed() -> void:
	owner_node.workspace.popup_menu_manager.open_import_menu(PopupMenuManager.MenuType.IMAGE, self)

func set_image(texture: Texture, _ptr: TexturePointer) -> void:
	thumbnail_button.texture_normal = texture
	self.ptr = _ptr

func init_from_ptr(_ptr: TexturePointer) -> void:
	thumbnail_button.texture_normal = _ptr.execute()
	self.ptr = _ptr
