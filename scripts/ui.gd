extends Control
@onready var overall_prog: Label = $overall_prog
@onready var guide: Control = $Guide
@onready var map: Control = $Map

@onready var progress_bar: ProgressBar = $ProgressBar

@onready var trust: Label = $trust
@onready var day: Label = $day
@onready var full_1: Sprite2D = $"Trust Mechanic/icon1/full_1"
@onready var half_1: Sprite2D = $"Trust Mechanic/icon1/half_1"
@onready var full_2: Sprite2D = $"Trust Mechanic/icon2/full_2"
@onready var half_2: Sprite2D = $"Trust Mechanic/icon2/half_2"
@onready var full_3: Sprite2D = $"Trust Mechanic/icon3/full_3"
@onready var half_3: Sprite2D = $"Trust Mechanic/icon3/half_3"
@onready var icon_1: Node2D = $"Trust Mechanic/icon1"
@onready var icon_2: Node2D = $"Trust Mechanic/icon2"
@onready var icon_3: Node2D = $"Trust Mechanic/icon3"
var tasks : Array[String] = []
var triggered_notif: Array[int] = []
var notifs = [
	{"day": 1,
	"hour":12,
	"text": "mom sent u a message",
	"task": "go to kedai"},
	{"day": 4,
	"hour":12,
	"text": "mom sent u a message",
	"task": "go home"}
]
@onready var v_box_container: VBoxContainer = $TaskList/VBoxContainer
@onready var task_list: Control = $TaskList




func _ready():
	
	day.text = "day" + str(Global.day)
func _process(delta):
	var hour = int(Global.hour)
	var trust = int(Global.trusts)
	var minutes = int(Global.hour - hour) * 60.0
	day.text = str( Global.day)
	progress_bar.value = Global.progress
	progress_bar.max_value = Global.max_progress
	if trust == 5:
		full_3.visible = false
		half_3.visible = true
	if trust == 4:
		half_3.visible = false
	if trust == 3:
		full_2.visible = false
		half_2.visible = true
	if trust == 2:
		half_2.visible = false
	if trust == 1:
		full_1.visible = false
		half_1.visible = true
	if trust == 0:
		half_3.visible = false	
		await get_tree().create_timer(0.05).timeout
		get_tree().change_scene_to_file("res://scenes/ending-done.tscn")
	if Global.progress >= Global.max_progress:
		get_tree().change_scene_to_file("res://scenes/ending-done.tscn")
	for notif in notifs:
		if notif ["day"] == Global.day\
		and int(notif["hour"]) == int(Global.hour):
			show_notification(notif["text"])
	for i in range(notifs.size()):
		var notif = notifs[i]	
		if notif["day"] == Global.day  and int(notif["hour"]) <= int(Global.hour):
			if not triggered_notif.has(i):
				triggered_notif.append(i)
				show_notification(notif["text"])
				add_task(notif["task"])
	

func _on_guide_button_pressed() -> void:
	guide.visible = not guide.visible


func _on_map_button_pressed() -> void:
	map.visible  =not map.visible
func show_notification(text: String) -> void:
	$NotificationPanel/Label.text = text
	$NotificationPanel.visible = true
	await get_tree().create_timer(1.0).timeout
	$NotificationPanel.visible = false
func add_task(task_text: String) -> void:

	update_task_list()
func update_task_list() -> void:
	for child in v_box_container.get_children():
		child.queue_free() 
		
	if tasks.size()== 0:
		var no_task_label:= Label.new()
		no_task_label.text = "no task for today"
		v_box_container.add_child(no_task_label)
		return
		
	for task_text in tasks:
		var task_label:= Label.new()
		task_label.text = task_text
		v_box_container.add_child(task_label)
