extends Node

var fighter: Fighter
var deal_contact_damage_event: DealContactDamageEvent

func init(_fighter: Fighter, _deal_contact_damage_event: DealContactDamageEvent) -> void:
	self.fighter = _fighter
	self.deal_contact_damage_event = _deal_contact_damage_event
	
	fighter.fighter_signals.deal_contact_damage.connect(on_deal_contact_damage)

func on_deal_contact_damage() -> void:
	deal_contact_damage_event.trigger({
		"actor": fighter
	})
