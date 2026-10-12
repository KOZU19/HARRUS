extends Node2D
@onready var bob: Sprite2D = $bob
var strength := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	bob.global_position.x += strength
	
	


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")
