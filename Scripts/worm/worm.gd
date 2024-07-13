extends Node2D

var segments: Array
@onready var worm_head = $"Worm Head"
@onready var segment_1 = $"Segment 1"
@onready var segment_2 = $"Segment 2"
@onready var segment_3 = $"Segment 3"

func _ready():
	#this is so that is never moves with the map
	set_as_top_level(true)
	segments = []
	segments.append(worm_head)
	segments.append(segment_1)
	segments.append(segment_2)
	segments.append(segment_3)
	
	for i in range(1, segments.size()):
		segments[i].follow(segments[i - 1])

func enable_movement():
	worm_head.set_physics_process(true)

	
func disable_movement():
	worm_head.set_physics_process(false)

