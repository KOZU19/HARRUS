extends Control
@onready var doc: Control = $Doc
@onready var chat: Control = $chat
@onready var draw_app: Control = $"draw app"



func _on_app_1_pressed() -> void:
	doc.visible = true


func _on_app_2_pressed() -> void:
	chat.visible = true


func _on_app_3_pressed() -> void:
	draw_app.visible = true


func _on_doc_home_pressed() -> void:
	doc.visible = false


func _on_chat_home_pressed() -> void:
	chat.visible = false


func _on_draw_home_pressed() -> void:
	draw_app.visible = false
