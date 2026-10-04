extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if  Global.hour >= 20.0:
		print("kok masih diluar")
		$"Warning panel".visible = true
		await get_tree().create_timer(3.0).timeout
		$"Warning panel".visible = false
	else:
		$"Warning panel".visible = false
		


func _on_house_area_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/MCroom.tscn")
