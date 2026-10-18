extends Node2D

func _ready() -> void:
	BattleEventBus.start_battle.connect(clear_particles)

func clear_particles(_fighter_one_profile, _fighter_two_profile) -> void:
	for particle: Node in get_children():
		particle.queue_free()
