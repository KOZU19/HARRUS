# game1.gd
extends Control
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var drop_zone: ColorRect = $Set1/DropZone
@onready var drop_zone_2: ColorRect = $Set2/DropZone2
@onready var drop_zone_3: ColorRect = $Set3/DropZone3
@onready var drop_zone_4: ColorRect = $Set4/DropZone4
@onready var drop_zone_5: ColorRect = $Set5/DropZone5
func _process(delta: float) -> void:
	update_progress()
func update_progress() -> void:
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
	var percentage := float(completed) / float(total) * 100
	progress_bar.value = percentage
