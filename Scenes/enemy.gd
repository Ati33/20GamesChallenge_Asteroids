extends CharacterBody2D

var speed = 200


func _physics_process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area.is_in_group("BulletGroup"):
		queue_free()


func _on_player_detect_area_body_entered(body):
	pass
