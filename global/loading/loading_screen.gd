extends Control

@export var progress_bar: ProgressBar
@export var min_timer: Timer
var progress = []
var path_to_load: String

func _ready() -> void:
	path_to_load = LoadManager.target_scene_path
	min_timer.start()
	ResourceLoader.load_threaded_request(path_to_load)

# Update progress bar with current load progress
# If the minimum time has not been exceeded yet 
func _process(_delta: float) -> void:
	var status = ResourceLoader.load_threaded_get_status(path_to_load, progress)
	
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			var prog = progress[0] * 100.0
			progress_bar.value = prog if min_timer.is_stopped() else min(95.0, prog)
		ResourceLoader.THREAD_LOAD_LOADED:
			if min_timer.is_stopped():
				progress_bar.value = 100.0
				var packed_scene = ResourceLoader.load_threaded_get(path_to_load)
				get_tree().change_scene_to_packed(packed_scene)
				set_process(false)
			else:
				progress_bar.value = 95.0
		ResourceLoader.THREAD_LOAD_FAILED:
			print("Loading failed!")
			set_process(false)
