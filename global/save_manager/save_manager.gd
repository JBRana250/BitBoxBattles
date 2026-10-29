extends Node

@export var fighter_profiles: FighterProfiles

func save_fighter_profiles() -> void:
	ResourceSaver.save(fighter_profiles, "user://fighter_profiles.tres")
