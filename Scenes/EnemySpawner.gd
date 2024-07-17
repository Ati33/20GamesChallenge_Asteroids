extends Node2D

@export var enemy_scene : PackedScene
@export var bullet_scene : PackedScene 
@onready var view = get_viewport_rect()

# Called when the node enters the scene tree for the first time.
func _ready():
	_spawn_enemies()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_shoot(location, direction):
	$"../BulletManager"._on_enemy_shoot(location, direction)


func _on_spawner_timer_timeout():
	_spawn_enemies()


func _spawn_enemies():
	view = get_viewport_rect()
	for i in 9:
		var enemy_instance = enemy_scene.instantiate()
		var rndposx = randf_range(10, view.size.x-10)
		var rndposy = randf_range(10, view.size.y-10)
		var rndpos = Vector2(rndposx, rndposy)
		add_child(enemy_instance)
		enemy_instance.position = rndpos
		enemy_instance.enemy_shoot.connect(_on_enemy_shoot)



