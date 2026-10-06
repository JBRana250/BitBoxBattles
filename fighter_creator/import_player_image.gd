extends TextureRect

@export var min_scale: Vector2 = Vector2(0.5, 0.5)
@export var max_scale: Vector2 = Vector2(3.0, 3.0)

func _on_file_dialog_file_selected(path: String) -> void:
	var image: Image = Image.load_from_file(path)
	resize_image_if_larger(image, 150, 150)
	if (image):
		var _texture: Texture = ImageTexture.create_from_image(image)
		self.texture = _texture

func resize_image_if_larger(img: Image, max_width: int, max_height: int) -> void:
	# Get the current dimensions of the image
	var current_width = img.get_width()
	var current_height = img.get_height()
	
	# Check if the image exceeds either constraint
	if current_width > max_width or current_height > max_height:
		# Calculate the scaling factor to maintain the aspect ratio
		var scale_factor = min(float(max_width) / current_width, float(max_height) / current_height)
		
		var new_width = int(current_width * scale_factor)
		var new_height = int(current_height * scale_factor)
		
		# Resize the image using a high-quality interpolation filter
		img.resize(new_width, new_height, Image.INTERPOLATE_LANCZOS)

func zoom_image(factor: float):
	var new_scale = scale * factor
	# Clamp scale to keep it within reasonable bounds
	new_scale.x = clamp(new_scale.x, min_scale.x, max_scale.x)
	new_scale.y = clamp(new_scale.y, min_scale.y, max_scale.y)
	
	scale = new_scale
