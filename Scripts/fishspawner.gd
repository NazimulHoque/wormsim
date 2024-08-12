extends Node2D


var fish = preload("res://Scenes/fish.tscn")
#dont forget to add these to the inspector variables!
var rng = RandomNumberGenerator.new()

#for testing
@export  var mediumfish_scene: PackedScene
@export  var fastfish_scene: PackedScene
@export  var slowfish_scene: PackedScene
 
@export var timeBetweenSpawns = 3
var spawn_ready = false
var playAreaHeight = 1560

var fishspawn1 
var fishspawn2 
var fishspawn3 
var fishspawn4 
var fishes = []

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
		#get marker nodes
		randomiseSpawn(fishspawn1)
		randomiseSpawn(fishspawn2)
		randomiseSpawn(fishspawn3)
		randomiseSpawn(fishspawn4)
		spawn_fish(fishspawn1, 0)
		spawn_fish(fishspawn2, 1)
		spawn_fish(fishspawn3, 2)
		spawn_ready = false


func _on_spawntimer_timeout():
	spawn_ready = true


func spawn_fish( fishspawn: Marker2D, type = 0 ):
	#spawn fish

	#var mfish = mediumfish_scene.instantiate()
	var spawnx = fishspawn.global_position.x
	var dir = 1
	if spawnx > 0:
		dir = -1
	var fish = create_fish(type, dir)
	fish.global_position = fishspawn.global_position
	add_child(fish)



func create_fish(type = 0, dir = 1):
	#this function creates fish based on type(int)
	var fish = fish.instantiate()
	fish.fish_type = type
	fish.direction = dir
	return fish

func randomiseSpawn(fishspawn1: Marker2D):
	#ideally they would spawn within play area
	#spaced apart just enough to let the worm go 
	var rngx = rng.randi_range(0, 1)
	var rng1 = rng.randf_range(200, 1472)
	#var rng2 = rng.randf_range(200, 1472)
	#var rng3 = rng.randf_range(200, 1472)
	#var rng4 = rng.randf_range(200, 1472)
	# fishSpawnOffset shifts the spawn point left
	var fishSpawnOffset = -30
	#eventually we will use the viewport to set position bounds
	#print(get_viewport_rect().size)
	#print(fishspawn1.position)
	#print(fishspawn2.position)
	#print(fishspawn3.position)
	#print(fishspawn4.position)
	if rngx == 0:
		fishspawn1.set_position(Vector2(fishSpawnOffset,rng1))
	else:
		fishspawn1.set_position(Vector2((fishSpawnOffset+892),rng1))
	#fishspawn2.set_position(Vector2(fishSpawnOffset,rng2))
	#fishspawn3.set_position(Vector2(fishSpawnOffset,rng3))
	#fishspawn4.set_position(Vector2(fishSpawnOffset,rng4))


func pauseSpawn():
	pass
