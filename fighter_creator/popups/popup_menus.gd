class_name PopupMenuManager extends Control

func _ready() -> void:
	visible = true

enum MenuType {
	EVENT,
	ACTION,
	CONDITION,
	STATE,
	IMAGE
}

@export var workspace: Workspace

@export var event_popup_menu: AddNodePopupMenu
@export var action_popup_menu: AddNodePopupMenu
@export var condition_popup_menu: AddNodePopupMenu
@export var state_popup_menu: AddNodePopupMenu

@export var image_popup_menu: ImportPopupMenu

func open_node_creation_menu(type: MenuType, parent_node: CompositeGraphNode):
	match (type):
		MenuType.EVENT:
			event_popup_menu.open_menu(parent_node)
		MenuType.ACTION:
			action_popup_menu.open_menu(parent_node)
		MenuType.CONDITION:
			condition_popup_menu.open_menu(parent_node)
		MenuType.STATE:
			state_popup_menu.open_menu(parent_node)

func open_import_menu(type: MenuType):
	match (type):
		MenuType.IMAGE:
			image_popup_menu.open_menu()

func close_all_popups() -> void:
	for child: Control in get_children():
		child.hide()
