class_name FighterSignals extends Resource

signal deal_contact_damage
signal take_contact_damage

func emit_deal_contact_damage():
	deal_contact_damage.emit()

func emit_take_contact_damage():
	take_contact_damage.emit()
