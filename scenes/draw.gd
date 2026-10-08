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
var total := 5
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			current_pose += 1
			if current_pose > poses.size():
				current_pose = poses.size()
			$Canvas/pose.texture = poses[current_pose - 1]
			completed += 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Canvas/pose.texture =preload("res://sprites/godoticons/pose1.png")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var percentage = float(completed) / float(total) * 100
	$ProgressBar.value = percentage


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/drawapp_home.tscn")
