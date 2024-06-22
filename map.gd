extends Node2D

static var speed = 15

# Called when the node enters the scene tree for the first time.


func _physics_process(delta: float) -> void:
	global_position.y += speed * delta 
