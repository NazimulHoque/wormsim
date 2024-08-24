extends Node2D

signal change_spawn_types(spawntypes)

@onready var level : Level = $".."
@onready var fs : FishSpawner = $fishspawner
#responsible for managing the wave as well as procedural generation of fish as the round progresses 
#
# Called when the node enters the scene tree for the first time.

@export  var score = 0
@export  var difficulty = 1
#spawn rate
#speed
#type


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_score_changed(score):
	if level:
		#print(score)
		if score % 50 == 0:
			if fs.timeBetweenSpawns > 1:
				fs.timeBetweenSpawns = fs.timeBetweenSpawns * 0.8
			else:
				fs.timeBetweenSpawns = 1
		#testing
		rule1()
			
		#do stuff 
		#set the rules of the next wave
		#use a dictionary
		#modify rules based on score


func rule1():
	#test of rules and interface 
	if score == 10:
		fs.change_spawn_types([0,0,0,0])
	elif score == 20:
		fs.change_spawn_types([1,1,1,1])
	elif score == 30:
		fs.change_spawn_types([2,2,2,2])
	elif score == 40:
		fs.change_spawn_types([0,1,2,0])
