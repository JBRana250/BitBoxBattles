extends TextureRect

@export var state_machine: SpriteEditorStateMachine
@export var checkerboard: ColorRect
@export var canvas_size: int

var image: Image

func _ready() -> void:
	image = Image.create(canvas_size, canvas_size, false, Image.FORMAT_RGBA8)
	checkerboard.material.set_shader_parameter("num_checkers", canvas_size)
	image.fill(Color.TRANSPARENT)
	texture = ImageTexture.create_from_image(image)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and state_machine.get_state() != state_machine.State.ERASER:
		state_machine.set_state(state_machine.State.QUICK_ERASE)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and state_machine.get_state() == state_machine.State.QUICK_ERASE:
		state_machine.set_state(state_machine.State.PENCIL)
	var is_click: bool = event is InputEventMouseButton and event.pressed
	var is_drag: bool = event is InputEventMouseMotion and event.button_mask
	
	if is_click or is_drag:
		var local_mouse_pos: Vector2 = event.position
		var uv_pos = local_mouse_pos / size
		var clicked_pixel: Vector2i = (uv_pos * Vector2(canvas_size, canvas_size)).floor()
		match state_machine.current_state:
			state_machine.State.PENCIL:
				set_pixel(clicked_pixel.x, clicked_pixel.y, state_machine.current_color)
			state_machine.State.ERASER:
				set_pixel(clicked_pixel.x, clicked_pixel.y, Color.TRANSPARENT)
			state_machine.State.QUICK_ERASE:
				set_pixel(clicked_pixel.x, clicked_pixel.y, Color.TRANSPARENT)
			state_machine.State.PICK:
				state_machine.current_color = image.get_pixel(clicked_pixel.x, clicked_pixel.y)
				state_machine.update_color()

func set_pixel(x: int, y: int, color: Color):
	image.set_pixel(x, y, color)
	texture.update(image)
