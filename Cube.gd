extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var ai_controller_3d = $AIController3D
var first_pos:Vector3
func _ready():
	first_pos = position
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
	velocity.x = ai_controller_3d.move.x * SPEED
	velocity.z = ai_controller_3d.move.y * SPEED
	move_and_slide()
func _on_area_3d_area_entered(area):
	print("area" + str(area.name))
	if area.is_in_group("Target"):
		position = first_pos
		ai_controller_3d.reward += 10
	elif area.is_in_group("Wall"):
		position = first_pos
		ai_controller_3d.reward -= 5
	pass # Replace with function body.
