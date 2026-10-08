extends Node
var progress = 0
const max_progress  = 100
var trusts = 6
var day : int = 1
var hour : float = 8.0
var time_speed : float = 15.0
var all_task := 3
var progress_doc := 0.0
var progress_storyboard := 0.0
var progress_draw := 0.0
var progress_all_task := 0
func _process(delta: float) -> void:
	
	update_timer(delta)
func update_timer(delta):
	hour += delta * time_speed
	if hour >= 24.0:
		hour -= 24.0
		day += 1	
	print( "day: ", day, "hour: ", hour)
func update_global_progress():
	progress = (progress_doc + progress_storyboard + progress_draw) / 3.0
