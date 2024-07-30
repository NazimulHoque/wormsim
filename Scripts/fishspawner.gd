extends Node2D

var fish = preload("res://Scenes/fish.tscn")
#dont forget to add these to the inspector variables!
var rng = RandomNumberGenerator.new()
@export  var mediumfish_scene: PackedScene
@export  var fastfish_scene: PackedScene
@export  var slowfish_scene: PackedScene

@export var timeBetweenSpawns = 2
var spawn_ready = false
var playAreaHeight = 1560

var fishspawn1 
var fishspawn2 
var fishspawn3 
var fishspawn4 

# Called when the node enters the scene tree for the first time.
func _ready():
	fishspawn1 = $fishspawn1
	fishspawn2 = $fishspawn2
	fishspawn3 = $fishspawn3
	fishspawn4 = $fishspawn4
	$spawntimer.set_wait_time(timeBetweenSpawns)
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

	#var mfish = mediumfish_scene.instantiate()
	var mfish = create_fish(0)
	mfish.global_position = fishspawn1.global_position
	add_child(mfish)
	

	#var ffish = fastfish_scene.instantiate()
	var ffish = create_fish(1)
	ffish.global_position = fishspawn2.global_position
	add_child(ffish)
	

	#var sfish = slowfish_scene.instantiate()
	var sfish = create_fish(2)
	sfish.global_position = fishspawn3.global_position
	add_child(sfish)
	



func create_fish(type = 0):
	#this function creates fish based on type,speed and dir entered
	var fish1 = fish.instantiate()
	fish1.fish_type = type
	return fish1



func randomiseSpawn():
	#ideally they would spawn within play area
	#spaced apart just enough to let the worm go 
	var rng1 = rng.randf_range(200, 1472)
	var rng2 = rng.randf_range(200, 1472)
	var rng3 = rng.randf_range(200, 1472)
	var rng4 = rng.randf_range(200, 1472)
	# fishSpawnOffset shifts the spawn point left
	var fishSpawnOffset = -30
	#eventually we will use the viewport to set position bounds
	#print(get_viewport_rect().size)
	#print(fishspawn1.position)
	#print(fishspawn2.position)
	#print(fishspawn3.position)
	#print(fishspawn4.position)
	fishspawn1.set_position(Vector2(fishSpawnOffset,rng1))
	fishspawn2.set_position(Vector2(fishSpawnOffset,rng2))
	fishspawn3.set_position(Vector2(fishSpawnOffset,rng3))
	fishspawn4.set_position(Vector2(fishSpawnOffset,rng4))


func pauseSpawn():
	pass
