extends FileDialog

func _ready() -> void:
	access = FileDialog.ACCESS_FILESYSTEM
	var downloads_path = OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS)
	current_dir = downloads_path
