extends Control
@onready var pose: Sprite2D = $Canvas/pose
@onready var progress_bar: ProgressBar = $ProgressBar

var current_pose:= 1
var poses = [
	preload("res://sprites/godoticons/pose1.png"),
	preload("res://sprites/godoticons/pose2.png"),
	preload("res://sprites/godoticons/pose3.png"),
	preload("res://sprites/godoticons/pose4.png"),
	preload("res://sprites/godoticons/pose5.png")
]
var completed := 0
var file_completed := false
var pose_progress = 0.0
var total := 5
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			current_pose += 1
			if current_pose > poses.size():
				current_pose = poses.size()
			if completed < poses.size():
				completed += 1
			if completed == poses.size() and  !file_completed:	
				Global.draw_files_completed += 1
				Global.progress_draw = float(Global.draw_files_completed) / Global.draw_files_total
			$Canvas/pose.texture = poses[current_pose - 1]
			completed += 1
			pose_progress = float(completed) / poses.size()
			
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Canvas/pose.texture =preload("res://sprites/godoticons/pose1.png")

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pose_progress = float(completed) / float(total) * 100
	$ProgressBar.value = pose_progress
	
	print(Global.progress_draw * 100)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/drawapp_home.tscn")
