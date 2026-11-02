@tool
class_name ImageImporter extends Importer

@export var owner_node: CompositeGraphNode
@export var label: Label
@export var thumbnail_button: TextureButton
var properties: Dictionary

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

func recieve_imported_data(import_properties: Dictionary) -> void:
	thumbnail_button.texture_normal = import_properties.thumbnail
	properties = import_properties

func init_from_properties(_properties: Dictionary) -> void:
	if _properties.is_empty():
		return
	thumbnail_button.texture_normal = _properties.thumbnail
	properties = _properties
