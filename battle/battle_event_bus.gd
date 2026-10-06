extends Node

@warning_ignore_start("unused_signal")
signal fighter_damaged(fighter_id: String)
signal fighter_death(fighter_id: String)
signal victory()

signal start_battle(fighter_one_profile: FighterProfile, fighter_two_profile: FighterProfile)
signal spawn_fighters(fighter_one_profile: FighterProfile, fighter_two_profile: FighterProfile)
signal clear_fighters()
