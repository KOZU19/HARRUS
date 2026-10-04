extends Control
@onready var home_tab: Control = $"tabs/Home-tab"
@onready var project_tab: Control = $"tabs/Project-tab"
@onready var resources_tab: Control = $"tabs/Resources-tab"


func _ready() -> void:
	home_tab.visible = true
	project_tab.visible = false
	resources_tab.visible = false


func _process(delta: float) -> void:
	pass


func _on_resources_pressed() -> void:
	home_tab.visible = false
	project_tab.visible = false
	resources_tab.visible = true


func _on_home_pressed() -> void:
	home_tab.visible = true
	project_tab.visible = false
	resources_tab.visible = false

func _on_project_pressed() -> void:
	home_tab.visible = false
	resources_tab.visible = false
	project_tab.visible = true
