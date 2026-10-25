extends Label

@onready var fighters = []

@export var display_anim_player: AnimationPlayer

func _ready() -> void:
	BattleEventBus.fighter_death.connect(on_fighter_death)
	BattleEventBus.start_battle.connect(on_start_battle)

func on_fighter_death(fighter_id: String) -> void:
	fighters.erase(fighter_id)
	if fighters.size() == 1:
		var winner_id = fighters.front()
		change_text(winner_id + " Wins!")
		BattleEventBus.victory.emit()
		return
	if fighters.size() == 0:
		change_text("It's a tie!")
		BattleEventBus.victory.emit()
		return

func change_text(new_text: String) -> void:
	display_anim_player.play("display_to_static")
	text = new_text
	await display_anim_player.animation_finished
	display_anim_player.play("static_to_display")

func on_start_battle(fighter_one_profile: FighterProfile, fighter_two_profile: FighterProfile) -> void:
	var fighter_one_id: String = fighter_one_profile.init_resource.fighter_id
	var fighter_two_id: String = fighter_two_profile.init_resource.fighter_id
	fighters = [fighter_one_id, fighter_two_id]
	text = fighter_one_id + " vs " + fighter_two_id
	label_settings.font_size = 36
