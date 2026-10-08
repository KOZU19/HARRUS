extends Control
@onready var drop_zone: ColorRect = $DropZones/DropZone
@onready var drop_zone_2: ColorRect = $DropZones/DropZone2
@onready var drop_zone_3: ColorRect = $DropZones/DropZone3
@onready var drop_zone_4: ColorRect = $DropZones/DropZone4
@onready var drop_zone_5: ColorRect = $DropZones/DropZone5
@onready var drop_zone_6: ColorRect = $DropZones/DropZone6
@onready var drop_zone_7: ColorRect = $DropZones/DropZone7
@onready var drop_zone_8: ColorRect = $DropZones/DropZone8
@onready var drop_zone_9: ColorRect = $DropZones/DropZone9
@onready var progress_bar: ProgressBar = $ProgressBar
func _process(delta: float) -> void:
	update_progress()
func update_progress():
	var completed := 0
	var total := 5
	if drop_zone.is_filled:
		completed += 1
	if drop_zone_2.is_filled:
		completed += 1
	if drop_zone_3.is_filled:
		completed += 1
	if drop_zone_4.is_filled:
		completed += 1
	if drop_zone_5.is_filled:
		completed += 1
	if drop_zone_6.is_filled:
		completed += 1
	if drop_zone_7.is_filled:
		completed += 1
	if drop_zone_8.is_filled:
		completed += 1
	if drop_zone_9.is_filled:
		completed += 1
	print(completed)
	var percentage := float(completed) / float(total) * 100
	progress_bar.value = percentage
