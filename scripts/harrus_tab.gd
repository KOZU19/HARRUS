extends Control
@onready var home_tab: Control = $"tabs/Home-tab"
@onready var project_tab: Control = $"tabs/Project-tab"
@onready var resources_tab: Control = $"tabs/Resources-tab"
@onready var global_progress: ProgressBar = $"tabs/Project-tab/GlobalProgress"
@onready var doc_progress: ProgressBar = $"tabs/Project-tab/doc_progress"
@onready var storyboard_progress: ProgressBar = $"tabs/Project-tab/storyboard_progress"
@onready var draw_progress: ProgressBar = $"tabs/Project-tab/draw_progress"


func _ready() -> void:
	home_tab.visible = true
	project_tab.visible = false
	resources_tab.visible = false


func _process(delta: float) -> void:
	global_progress.value = Global.progress
	doc_progress.value = Global.progress_doc
	storyboard_progress.value = Global.progress_storyboard
	draw_progress.value = Global.progress_draw

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
