class_name PopupMenuManager extends Control

enum MenuType {
	EVENT,
	ACTION,
	CONDITION
}

@export var workspace: Workspace
@export var event_popup_menu: AddNodePopupMenu
@export var action_popup_menu: AddNodePopupMenu
@export var condition_popup_menu: AddNodePopupMenu

func open_menu(type: MenuType, parent_node: CompositeGraphNode):
	match (type):
		MenuType.EVENT:
			event_popup_menu.open_menu(parent_node)
		MenuType.ACTION:
			action_popup_menu.open_menu(parent_node)
		MenuType.CONDITION:
			condition_popup_menu.open_menu(parent_node)
