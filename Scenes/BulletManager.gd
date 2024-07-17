extends Node2D

@export var bullet_scene : PackedScene 
@export var enemy_bullet_scene : PackedScene 


func _on_player_player_shoot_2(location, direction):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position = location
	bullet.direction = direction.normalized()
	bullet.add_to_group("BulletGroup")


func _on_enemy_shoot(location, direction):
	var enemy_bullet = enemy_bullet_scene.instantiate()
	add_child(enemy_bullet)
	enemy_bullet.position = location
	enemy_bullet.direction = -direction.normalized()
