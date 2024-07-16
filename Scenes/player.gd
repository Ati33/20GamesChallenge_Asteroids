extends CharacterBody2D

const SPEED : float = 100.0
var mouse_position = Vector2(0, 0)
var direction = Vector2(0, 0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	look_at(mouse_position)
	direction = (mouse_position - position).normalized()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("forward"):
		velocity += direction * SPEED * delta
	move_and_slide()





