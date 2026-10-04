extends Node3D
var interacting = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_kasur_body_entered(body: CharacterBody3D) -> void:
	$Aldo.global_position = $Marker3D.global_position
	
	#interacting = true
	#kasur()
#func kasur():
	#if Input.is_action_just_pressed("interact") and interacting == true:
		#print("work")

func _on_kasur_body_exited(body: Node3D) -> void:
	$Aldo.global_position = $Marker3D2.position
