class_name ImageGalleryPopup extends Control

var importer: ImageImporter
@export var title_label: Label
@export var static_gallery_hflow: HFlowContainer
@export var user_gallery_hflow: HFlowContainer
var current_ptr: TexturePointer

signal item_selected(item: ImageGalleryItem)

func open_menu(_importer: ImageImporter) -> void:
	self.importer = _importer
	title_label.text = "Choose " + importer.label_text + " Image"
	
	clear_static_gallery()
	populate_static_gallery()
	
	visible = true

func clear_static_gallery() -> void:
	for item: ImageGalleryItem in static_gallery_hflow.get_children():
		item.queue_free()

func populate_static_gallery() -> void:
	var item_scene: PackedScene = ImageGalleryItem.load_scene()
	
	for id: StaticTextures.ID in StaticTextures.get_ids():
		var selected: bool = importer.ptr.id == id and importer.ptr.type == TexturePointer.Type.STATIC
		var item_instance = ImageGalleryItem.create(id, self, item_scene, selected)
		if selected:
			current_ptr = TexturePointer.new(id)
		static_gallery_hflow.add_child(item_instance)

func on_static_gallery_item_pressed(ptr: TexturePointer, item: ImageGalleryItem) -> void:
	current_ptr = ptr
	item_selected.emit(item)

func _on_confirm_button_pressed() -> void:
	importer.set_image(current_ptr.execute(), current_ptr)
	visible = false
