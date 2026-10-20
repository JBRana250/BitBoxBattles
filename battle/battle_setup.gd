class_name BattleSetup extends Control

@export var fighter_one: FighterSetupButton
@export var fighter_two: FighterSetupButton

func _ready() -> void:
	setup()

func setup() -> void:
	visible = true
	fighter_one.play_setup_animation()
	fighter_two.play_setup_animation()
