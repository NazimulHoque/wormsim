extends Node2D
@export var speed = 10
#1 is right, -1 is left
@export var direction = 1
#scripts for slowfish and fast fish use the same script set to 'unique'
var sprite
var size
#fish lifetime in seconds
var lifetime = 2

func _ready():
	$Timer.wait_time = lifetime
	$Timer.one_shot = true
	$Timer.start()


func _physics_process(delta):
	move_local_x(speed*direction)


func _on_timer_timeout():
	#print("fish has died")
	queue_free()
