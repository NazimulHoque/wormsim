extends Node2D

class_name Fish


#process for adding new fish
#add new texture rect with new texture 
# add speed switch case in setFishTypeSpeed
# 

@export var speed = 10
#1 is right, -1 is left
@export var direction = 1
#scripts for slowfish and fast fish use the same script set to 'unique'
#fish lifetime in seconds
var lifetime = 2
var fish_names = []
var fish_type



func _ready():
	getFishNames()
	setChildVisibility(fish_names[fish_type])
	setFishTypeSpeed(fish_type)
	$Timer.wait_time = lifetime
	$Timer.one_shot = true
	$Timer.start()



func _physics_process(delta):
	move_local_x(speed*direction)


func _on_timer_timeout():
	#print("fish has died")
	queue_free()


func setChildVisibility(fname = 'name'):
	#sets visibility of all children except one, if none is specifies then all is set to not visible
	var children =  get_children()
	for c in children:
		if not (c is Timer):
			if c.get_name() == fname:
				c.set_visible(true)
			else:
				c.set_visible(false)


func getFishNames():
	#gets the names of all the texture_rects(fish) in the hierarchy
	var children =  get_children()
	for c in children:
		if not (c is Timer):
			fish_names.append(c.get_name())



func setFishTypeSpeed(ftype = 0):
	# a bunch of switch statements for speed
	match ftype:
		0:
			# fish 10
			speed = 10	
		1:
			#fast fish 12
			speed = 12
		2:
			#slow fish 8
			speed = 8

