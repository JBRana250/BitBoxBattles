extends ActionCompositeGraphNode

@export var sfx_label: Label
@export var waveform_visualiser: ColorRect
var current_sfx: AudioStream
var sfx_name: String

# Override
# On load workspace, set all values of this graphnode
# to be the last saved values
func init_node(node_res: NodeResource) -> void:
	var properties: Dictionary = node_res.properties
	if properties.is_empty():
		return
	current_sfx = properties.sfx
	self.sfx_name = properties.sfx_name
	update_sfx_visuals()

# Override
# On save workspace, it saves all values of this graphnode
# so that when init_node is called it can load it
func get_properties() -> Dictionary:
	return {
		"sfx": current_sfx,
		"sfx_name": sfx_name
	}

# Override
# Obtains the battle-ready Action for the actual Fighter
func process_action() -> Action:
	var play_sfx_action: PlaySFXAction = PlaySFXAction.new()
	play_sfx_action.conditions = get_conditions()
	play_sfx_action.sfx = current_sfx
	return play_sfx_action

func _on_file_dialog_file_selected(path: String) -> void:
	# Check if file exists and is a regular file
	if not FileAccess.file_exists(path):
		printerr("File does not exist: ", path)
		return

	var extension = path.get_extension().to_lower()

	# Validate and load based on extension
	if extension == "mp3":
		current_sfx = AudioStreamMP3.load_from_file(path)
		sfx_name = path.get_file()
		update_sfx_visuals()
	elif extension == "wav":
		current_sfx = AudioStreamWAV.load_from_file(path)
		sfx_name = path.get_file()
		update_sfx_visuals()
	else:
		printerr("Unsupported audio format: ", extension)
		return
		
func update_sfx_visuals() -> void:
	sfx_label.text = sfx_name
	waveform_visualiser.material.set_shader_parameter("progress", 1.0)
