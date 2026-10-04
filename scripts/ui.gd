extends Control
@onready var overall_prog: Label = $overall_prog
@onready var guide: Control = $Guide
@onready var map: Control = $Map

@onready var progress_bar: ProgressBar = $ProgressBar

@onready var trust: Label = $trust
@onready var day: Label = $day
@onready var icon_1: Sprite2D = $"Trust Mechanic/icon1"
@onready var icon_2: Sprite2D = $"Trust Mechanic/icon2"
@onready var icon_3: Sprite2D = $"Trust Mechanic/icon3"


func _ready():
	
	day.text = "day" + str(Global.day)
func _process(delta):
	var hour = int(Global.hour)
	var trust = int(Global.trusts)
	var minutes = int(Global.hour - hour) * 60.0
	day.text = str( Global.day)
	progress_bar.value = Global.progress
	progress_bar.max_value = Global.max_progress
	if trust == 2:
		icon_3.visible = false
	if trust == 1:
		icon_2.visible = false
	if trust == 0:
		icon_1.visible = false
		await get_tree().create_timer(0.05).timeout
		get_tree().change_scene_to_file("res://scenes/ending-done.tscn")


func _on_guide_button_pressed() -> void:
	guide.visible = not guide.visible


func _on_map_button_pressed() -> void:
	map.visible  =not map.visible
