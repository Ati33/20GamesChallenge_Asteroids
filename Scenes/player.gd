extends CharacterBody2D

const SPEED : float = 250.0
var mouse_position : Vector2 = Vector2(0, 0)
var direction : Vector2 = Vector2(0, 0)
const bullet_scene = preload("res://Scenes/bullet.tscn")
signal player_shoot2(location, direction)
@onready var muzzle = $Muzzle
@onready var view := get_viewport_rect()


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
	if Input.is_action_pressed("backward"):
		velocity -= direction * SPEED * delta
	move_and_slide()
	_screen_wrap()


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		_shoot()


func _shoot():
	player_shoot2.emit(muzzle.global_position, direction)


func _screen_wrap():
	if position.x > view.size.x:
		position.x = 0
	if position.x < 0:
		position.x = view.size.x
	if position.y > view.size.y:
		position.y = 0
	if position.y < 0:
		position.y = view.size.y







