extends WorldEnvironment
@onready var sky_material: ProceduralSkyMaterial = environment.sky.sky_material
func _ready() -> void:

	sky_material.sky_top_color = Color("#ff9657")
	sky_material.sky_horizon_color = Color("#a36150")
	#update_sky()
func update_sky():
	var hour = Global.hour
	if hour >= 7.0 and hour < 12.0:
		day_color(sky_material)
	elif hour >=12.0 and hour < 17.0:
		noon_color(sky_material)
	elif hour >=17.0 and hour < 19.0:
		evening_color(sky_material)
	else:
		night_color(sky_material)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func day_color(sky_material):
	sky_material.sky_top_color = Color("#32b9db")
	sky_material.sky_horizon_color = Color("#9fc6d1")
func noon_color(sky_material):
	sky_material.sky_top_color = Color("#bbe5f0")
	sky_material.sky_horizon_color = Color("#d0d1bc")
func evening_color(sky_material):
	sky_material.sky_top_color = Color("#ff9657")
	sky_material.sky_horizon_color = Color("#a36150")
func night_color(sky_material):
	sky_material.sky_top_color = Color("#3e71b0")
	sky_material.sky_horizon_color = Color("#1f4573")
		
