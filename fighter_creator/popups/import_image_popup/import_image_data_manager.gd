class_name ImportImageDataManager extends Node

@export var imported_image: DraggableImportImage
var importer: ImageImporter
var resolution: Vector2
var center: Vector2:
	get:
		return (resolution - imported_image.size) / 2.0
