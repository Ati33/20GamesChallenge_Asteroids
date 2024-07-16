extends Node2D

@export var bullet_scene : PackedScene 


func _on_player_player_shoot_2(location, direction):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position = location
	bullet.direction = direction.normalized()
	bullet.add_to_group("BulletGroup")
	
