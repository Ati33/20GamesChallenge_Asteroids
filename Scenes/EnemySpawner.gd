extends Node2D

@export var enemy_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var view = get_viewport_rect()
	for i in 9:
		var enemy_instance = enemy_scene.instantiate()
		var rndposx = randf_range(10, view.size.x-10)
		var rndposy = randf_range(10, view.size.y-10)
		var rndpos = Vector2(rndposx, rndposy)
		add_child(enemy_instance)
		enemy_instance.position = rndpos
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
