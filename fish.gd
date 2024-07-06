extends Node2D
var speed = 100
var direction = 1
#scripts for slowfish and fast fish use the same script set to 'unique'
func _physics_process(delta):
	move_local_x(10)
