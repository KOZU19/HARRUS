extends TextureButton
@export var file : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:

	get_tree().change_scene_to_file("res://scenes/draw.tscn")


func _on_texture_rect_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/draw.tscn")


func _on_texture_rect_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/draw.tscn")


func _on_texture_rect_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/draw.tscn")


func _on_texture_rect_5_pressed() -> void:
	pass # Replace with function body.
