extends Area2D

@export var speed : int = 300
var direction : Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * direction * delta


func _physics_process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
