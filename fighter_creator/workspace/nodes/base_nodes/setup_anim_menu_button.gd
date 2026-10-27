extends MenuButton
const SetupAnimType = FighterInitResource.SetupAnimType

@onready var popup: PopupMenu = get_popup()
var current_setup_anim_type: SetupAnimType

func _ready() -> void:
	# Connect the signal from the popup menu to this script
	popup.id_pressed.connect(_on_item_pressed)

func set_checked_item(type: SetupAnimType) -> void:
	_on_item_pressed(type as int)

func _on_item_pressed(index: int) -> void:
	for i in popup.item_count:
		if popup.is_item_radio_checkable(i):
			popup.set_item_checked(i, false)
	popup.set_item_checked(index, true)
	
	current_setup_anim_type = index as SetupAnimType

	set_text_from_index(index)

func set_text_from_index(index: int) -> void:
	var item_string: String = popup.get_item_text(index)
	text = "Setup Animation Type: " + item_string

func get_anim_type() -> SetupAnimType:
	return current_setup_anim_type
