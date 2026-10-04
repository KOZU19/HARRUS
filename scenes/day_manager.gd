extends Node
@onready var sun: DirectionalLight3D = $"../DirectionalLight3D"
@onready var world: WorldEnvironment = $"../WorldEnvironment"
@onready var sky_material: ProceduralSkyMaterial = $"../WorldEnvironment".environment.sky.sky_material
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_day()
func update_day():
	var hour = Global.hour
	if hour >= 7.0 and hour <12.0:
		set_day()
	elif hour >= 12.0 and hour < 17.0:
		set_noon()
	elif hour >= 17.0 and hour < 19.0:
		set_evening()
	else:
		set_night()
	var sky_material= world.environment.sky.sky_material
func set_day():
	sun.light_energy = 8.0
	sky_material.sky_top_color = Color("#32b9db")
	sky_material.sky_horizon_color = Color("#9fc6d1")
func set_noon():
	sun.light_energy = 12.0
	sky_material.sky_top_color = Color("#bbe5f0")
	sky_material.sky_horizon_color = Color("#d0d1bc")
func set_evening():
	sun.light_energy = 0.8
	sky_material.sky_top_color = Color("#ff9657")
	sky_material.sky_horizon_color = Color("#a36150")
func set_night():
	sun.light_energy = 0.0
	sky_material.sky_top_color = Color("#3e71b0")
	sky_material.sky_horizon_color = Color("#1f4573")
