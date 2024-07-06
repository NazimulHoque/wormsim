extends Node2D


#dont forget to add these to the inspector variables!
@export  var depth = 0
@export  var difficulty = 1
@export  var mediumfish_scene: PackedScene
@export  var fastfish_scene: PackedScene
@export  var slowfish_scene: PackedScene

var spawn_ready = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$spawntimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spawn_ready:
		spawn_type()
		spawn_ready = false


func _on_spawntimer_timeout():
	spawn_ready = true


func spawn_type():
	#get marker nodes
	#way may be able to randomise positions 
	#we may be able to set fish speed within range 
	var fishspawn1 = $fishspawn1
	var fishspawn2 = $fishspawn2
	var fishspawn3 = $fishspawn3
	var fishspawn4 = $fishspawn4
	
	#spawn fish
	if mediumfish_scene:
		var mfish = mediumfish_scene.instantiate()
		mfish.global_position = fishspawn1.global_position
		add_child(mfish)
	
	if fastfish_scene:
		var ffish = fastfish_scene.instantiate()
		ffish.global_position = fishspawn2.global_position
		add_child(ffish)
	
	if slowfish_scene:
		var sfish = slowfish_scene.instantiate()
		sfish.global_position = fishspawn3.global_position
		add_child(sfish)
	
