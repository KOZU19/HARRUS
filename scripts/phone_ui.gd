extends Control
@onready var doc: Control = $Doc
@onready var chat: Control = $chat
@onready var draw_app: Control = $"draw app"



func _on_app_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/chat.tscn")


func _on_app_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/planning.tscn")

func _on_app_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/storyboard.tscn")
func _on_app_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/drawapp_home.tscn")
