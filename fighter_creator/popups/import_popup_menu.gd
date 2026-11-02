class_name ImportPopupMenu extends Control

@export var title_label: Label
@export var import_image_load: Node
var importer: ImageImporter

func open_menu(_importer: Importer) -> void:
	importer = _importer as ImageImporter
	title_label.text = "Import " + importer.label_text + " Image"
	
	var properties: Dictionary = importer.properties
	if properties.is_empty():
		import_image_load.reset_to_default()
	else:
		import_image_load.load_previous(properties)
