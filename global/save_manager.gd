extends Node

@export var fighter_profiles: FighterProfiles

func save_fighter_profiles() -> void:
	if fighter_profiles:
		ResourceSaver.save(fighter_profiles, "user://fighter_profiles.tres")
