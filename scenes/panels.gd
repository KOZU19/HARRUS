extends ColorRect
var dragging := false
var drag_offset := Vector2.ZERO
var og_pos := Vector2.ZERO
@export var drop_target : ColorRect
var current_drop_zoone : ColorRect = null
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				if current_drop_zoone == null:
					og_pos = global_position
				drag_offset = global_position-get_global_mouse_position()
			else:
				finish_drag()
				check_drop()
func _process(_delta):
	if dragging:
		global_position=get_global_mouse_position() + drag_offset
func finish_drag()-> void:
	dragging =false
func check_drop() -> void:
	var mouse_position:= get_global_mouse_position()
	if drop_target.get_global_rect().has_point(mouse_position):
		if current_drop_zoone != null:
			current_drop_zoone.is_filled = false
			current_drop_zoone.current_item= null
			current_drop_zoone = null
		if drop_target.is_filled:
			global_position = og_pos
			return
			
		
		global_position= drop_target.global_position
		drop_target.is_filled = true
		current_drop_zoone = drop_target
		drop_target.current_item = self
	else:
		if current_drop_zoone != null:
			current_drop_zoone.is_filled = false
			current_drop_zoone.current_item = null
			current_drop_zoone = null
		
		global_position = og_pos
	
