extends Node2D

var fish = preload("res://Scenes/fish.tscn")
#dont forget to add these to the inspector variables!

@export  var mediumfish_scene: PackedScene
@export  var fastfish_scene: PackedScene
@export  var slowfish_scene: PackedScene

var spawn_ready = false
var fishspawn1 
var fishspawn2 
var fishspawn3 
var fishspawn4 

var playAreaHeight = 1560
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	fishspawn1 = $fishspawn1
	fishspawn2 = $fishspawn2
	fishspawn3 = $fishspawn3
	fishspawn4 = $fishspawn4
	$spawntimer.autostart = true
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
	randomiseSpawn()
	
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
	



func create_fish(speed, dir, type):
	#this function creates fish based on type,speed and dir entered
	var fish1 = fish.instantiate()
	fish1.speed = speed
	fish1.direction = dir
	return fish1



func randomiseSpawn():
	#ideally they would spawn within play area
	#spaced apart just enough to let the worm go 
	var rng1 = rng.randf_range(200, 1472)
	var rng2 = rng.randf_range(200, 1472)
	var rng3 = rng.randf_range(200, 1472)
	var rng4 = rng.randf_range(200, 1472)
	# fishSpawnOffset shefts the spawn point left
	var fishSpawnOffset = -30
	print(get_viewport_rect().size)
	print(fishspawn1.position)
	print(fishspawn2.position)
	print(fishspawn3.position)
	print(fishspawn4.position)
	fishspawn1.set_position(Vector2(fishSpawnOffset,rng1))
	fishspawn2.set_position(Vector2(fishSpawnOffset,rng2))
	fishspawn3.set_position(Vector2(fishSpawnOffset,rng3))
	fishspawn4.set_position(Vector2(fishSpawnOffset,rng4))
