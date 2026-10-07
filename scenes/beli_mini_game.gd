extends Node2D
var trust = Global.trusts


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_1_pressed() -> void:
	print("aaaaaa")


func _on_button_2_pressed() -> void:
	print("aaaaa")


func _on_button_3_pressed() -> void:
	$Node.complete_task("go to toko")
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_button_4_pressed() -> void:
	print("aaaa")

func _on_button_5_pressed() -> void:
	print("aaaa")
	#get_tree().change_scene_to_file("res://scenes/world.tscn")
