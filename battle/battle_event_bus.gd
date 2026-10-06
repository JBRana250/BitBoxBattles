extends Node

@warning_ignore_start("unused_signal")
signal fighter_damaged(fighter_id: String)
signal fighter_death(fighter_id: String)
signal victory()

signal start_battle()
signal spawn_fighters()
signal clear_fighters()
