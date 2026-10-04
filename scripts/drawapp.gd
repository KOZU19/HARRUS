extends Control

@onready var drawing: Control = $Control/Drawing
@onready var anim: Control = $Control/Anim


func  _ready() -> void:
	$Control.visible = false
	


func _on_button_pressed() -> void:
	$Control.visible = true


func _on_drawing_cat_pressed() -> void:
	drawing.visible = true
	anim.visible = false


func _on_anim_cat_pressed() -> void:
	drawing.visible = false
	anim.visible = true
