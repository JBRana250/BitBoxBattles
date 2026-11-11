class_name GraphNodeScenes

enum SceneType {
	ROOT,
	BASE_STATS,
	BASE_SPRITES,
	SETUP,
	ABILITIES,
	
	REPEATING_TIMER,
	DEAL_CONTACT_DAMAGE,
	
	ACCEL_DASH,
	FIGHTER_DASH,
	CONTACT_DAMAGE_INCREASE,
	HEALTH_INCREASE,
	PLAY_SFX,
	
	STATE_CONDITION,
	
	ACTIVE_STATE,
	INACTIVE_STATE,
	
	NULL
}

var scenes: Dictionary[SceneType, PackedScene] = {}
var DIR_PATH: String = "res://fighter_creator/workspace/nodes/graph_node_scenes/"

func _init() -> void:
	for type in SceneType.keys():
		if SceneType[type] == SceneType.NULL:
			continue
		scenes[SceneType[type]] = load(DIR_PATH + type.to_lower() + "_graphnode.tscn")

func get_scene(type: SceneType) -> PackedScene:
	return scenes[type]
