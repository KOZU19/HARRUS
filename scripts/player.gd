extends CharacterBody3D
@export_category("Movement")
@export var walk_speed:float = 4.0
@export var sprint_speed: float= 7.5
@export var ground_acceleration: float = 22.0
@export var ground_decelaration:float = 28.0
@export var air_acceleration: float = 7.0
@export var rotation_speed : float = 12.0
@export_category("Jump")
@export var jump_force: float = 7.0
@export var gravity: float = 20.0
@export var terminal_velocity : float = 30.0
@export var coyote_time:float = 0.12
@export var jump_buffer_time: float = 0.12
@export var jump_cut_multiplier:float = 0.45

@export_category("Camera")
@export var camera: Camera3D

@export_category("Interaction")
@export var interaction_ray:RayCast3D
@export var interaction_distance: float = 3.0
@export_category("phone")
@export var phone_ui: Control
@export var harrus_tab: Control
var coyote_timer: float = 0.0
var jump_buffer_timer:float = 0.0

var is_sprinting:bool = false
var was_on_floor:bool = false
func _physics_process(delta: float) -> void:
	update_timers(delta)
	handle_input()
	handle_horizontal_movement(delta)
	handle_gravity(delta)
	handle_jump()
	handle_rotation(delta)
	handle_interaction()
	handle_phone()
	update_floor_state()
	move_and_slide()
	handle_harrus()
var movement_input:Vector2= Vector2.ZERO
func ready():
	setup_interaction_ray()
func handle_input()-> void:
	movement_input = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)
	is_sprinting= (
		Input.is_action_pressed("run")
		and movement_input.length() >0.1
	)
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = jump_buffer_time
func update_timers(delta: float)->  void:
	if jump_buffer_timer > 0.0:
		jump_buffer_timer -= delta
	if is_on_floor():
		coyote_timer = coyote_time
	else:
		coyote_timer -= delta
func handle_horizontal_movement(delta:float)-> void:
	var direction: Vector3 = get_camera_relative_direction()
	var target_speed: float = walk_speed
	if is_sprinting:
		target_speed = sprint_speed
		
	var target_velocity: Vector3 = direction * target_speed
	var acceleration : float
	if is_on_floor():
		if direction.length() > 0.01:
			acceleration = ground_acceleration
		else:
			acceleration = ground_decelaration
	else:
		acceleration = air_acceleration
	velocity.x = move_toward(
		velocity.x,
		target_velocity.x,
		acceleration * delta
	)	
	velocity.z = move_toward(
	velocity.z,
	target_velocity.z,
	acceleration * delta
)

func get_camera_relative_direction()-> Vector3:
	if camera == null:
		return Vector3.ZERO
	var forward:Vector3 = camera.global_transform.basis.z
	var right:Vector3 = camera.global_transform.basis.x
	forward.y = 0.0
	right.y = 0.0
	forward = forward.normalized()
	right = right.normalized()
	
	var direction: Vector3 = (
		right*movement_input.x + forward * movement_input.y
	)	
	if direction.length_squared()> 1.0:
		direction = direction.normalized()
	return direction
func handle_gravity(delta:float)-> void:
	if is_on_floor():
		if velocity.y <0.0:
			velocity.y = - 0.5
		return
	velocity.y -= gravity * delta
	velocity.y = max(
		velocity.y, -terminal_velocity
	)
func handle_jump()->void:
	if jump_buffer_timer <= 0.0:
		return
	if coyote_timer <= 0.0:
		return
	velocity.y = jump_force
	jump_buffer_timer= 0.0
	coyote_timer = 0.0
func _input(event: InputEvent) -> void:
	if event.is_action_released("jump"):
		if velocity.y > 0.0:
			velocity.y *= jump_cut_multiplier
func handle_rotation(delta:float)->void:
	var direction: Vector3 = get_camera_relative_direction()
	if direction.length_squared() < 0.001:
		return
	var target_angle:float = atan2(
		direction.x,
		direction.z
	)
	rotation.y = lerp_angle(
		rotation.y,
		target_angle,
		rotation_speed * delta
	)
func update_floor_state()-> void:
	var currently_on_floor: bool = is_on_floor()
	if currently_on_floor and not was_on_floor:
		on_landed()
	elif not currently_on_floor and was_on_floor:
		on_left_ground()
	was_on_floor = currently_on_floor
func on_landed()->void:
	print("landed")
func on_left_ground()-> void:
	print("left ground")
func setup_interaction_ray() -> void:
	if interaction_ray == null:
		return
	interaction_ray.target_position = Vector3(
		0.0,
		0.0,
		-interaction_distance
	)
func handle_interaction():
	
	if not Input.is_action_just_pressed("interact"):
		return
	if interaction_ray == null:
		return
	if not interaction_ray.is_colliding():
		return
	var object: Object  = interaction_ray.get_collider()
	if object == null:
		return
	if object.has_method("interact"):
		object.interact(self)
		print("works")
	else:
		("obj not found")
func handle_phone() -> void:
	if Input.is_action_just_pressed("phone"):
		toggle_phone()
func toggle_phone():
	if phone_ui == null:
		return
	phone_ui.visible = not phone_ui.visible
	Global.progress += 5
	Global.trusts -= 1
func  handle_harrus():
	if Input.is_action_just_pressed("harrus"):
		toggle_harrus()
func toggle_harrus():
	if harrus_tab == null:
		return
	harrus_tab.visible = not harrus_tab.visible
