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
		




func _on_manahan_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/Manahan.tscn")


func _on_home_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/MCroom.tscn")

func _on_pasar_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/pasar.tscn")


func _on_toko_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/toko kelontong.tscn")


func _on_kedai_body_entered(body: CharacterBody3D) -> void:
	get_tree().change_scene_to_file("res://scenes/kedai.tscn")
