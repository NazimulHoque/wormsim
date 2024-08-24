class_name FishSpawner
extends Node2D


var fish = preload("res://Scenes/fish.tscn")
@onready var spawntimer : Timer =  $spawntimer
#dont forget to add these to the inspector variables!
var rng = RandomNumberGenerator.new()

#for testing
@export  var mediumfish_scene: PackedScene
@export  var fastfish_scene: PackedScene
@export  var slowfish_scene: PackedScene
 
@export var timeBetweenSpawns: float = 3
var spawn_ready = false
var playAreaHeight = 1560

@onready var fishspawn1 = $fishspawn1
@onready var fishspawn2 = $fishspawn2
@onready var fishspawn3 = $fishspawn3
@onready var fishspawn4 = $fishspawn4
var fishes = []
var spawn_types = [0, 1, 2, 0]

# Called when the node enters the scene tree for the first time.
func _ready():
	spawntimer.set_wait_time(timeBetweenSpawns)
	spawntimer.autostart = true
	spawntimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawntimer_timeout():
	randomizeSpawn2()
	spawn_fish2(spawn_types)
	spawntimer.set_wait_time(timeBetweenSpawns)
	


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


func create_fish2(type = 0, dir = 1, speed = 8):
	var fish = fish.instantiate()
	fish.fish_type = type
	fish.direction = dir
	fish.speed = speed
	return fish

func randomizeSpawn(fishspawn1: Marker2D):
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

func randomizeSpawn2():
	#randomize spawns all at once
	randomizeSpawn(fishspawn1)
	randomizeSpawn(fishspawn2)
	randomizeSpawn(fishspawn3)
	randomizeSpawn(fishspawn4)
	
func spawn_fish2(spawntypes:Array):
	#an interface that is used by the fishmanger to create a custom set of fish for ever spawn event
	#should check if array is valid
	if spawn_types:
		spawn_fish(fishspawn1, spawntypes[0])
		spawn_fish(fishspawn2, spawntypes[1])
		spawn_fish(fishspawn3, spawntypes[2])
		spawn_fish(fishspawn4, spawntypes[3])
	
	

func pauseSpawn():
	pass



func change_spawn_types(spawntypes: Array):
	print(spawntypes)
	spawn_types =  spawntypes
	
