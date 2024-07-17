extends CharacterBody2D

const bullet_scene = preload("res://Scenes/bullet.tscn")
@onready var player = get_tree().current_scene.get_node("Player")
@onready var muzzle = $Muzzle
@onready var view := get_viewport_rect()
var speed = 1
var player_detected : bool
var direction : Vector2 
var player_location
var can_shoot : bool
signal enemy_shoot


func _physics_process(delta):
	if player_detected == true:
		velocity -= direction * speed * delta
	elif player_detected == false:
		velocity = Vector2(0, 0)
	move_and_slide()
	look_at(direction)
	_screen_wrap()


func _shoot():
	enemy_shoot.emit(muzzle.global_position, direction)


func _screen_wrap():
	if position.x > view.size.x:
		position.x = 0
	if position.x < 0:
		position.x = view.size.x
	if position.y > view.size.y:
		position.y = 0
	if position.y < 0:
		position.y = view.size.y


func _on_area_2d_area_entered(area):
	if area.is_in_group("BulletGroup"):
		queue_free()


func _on_player_detect_area_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		player_location = body.global_position
		direction = global_position - player_location
		player_detected = true


func _on_player_detect_area_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		player_detected = false


func _on_shoot_timer_timeout():
	_shoot()


func _on_shoot_detect_area_body_entered(body):
	$ShootTimer.start()


func _on_shoot_detect_area_body_exited(body):
	$ShootTimer.stop()
