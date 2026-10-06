class_name Gameflow
extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../ColorRect3".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.day >= 8:
		get_tree().change_scene_to_file("res://scenes/ending-done.tscn")
	if Global.hour >= 23:
		await get_tree().create_timer(0.05).timeout
		$"../ColorRect3".visible = true
		await get_tree().create_timer(0.05).timeout
		$"../ColorRect3".visible = false
