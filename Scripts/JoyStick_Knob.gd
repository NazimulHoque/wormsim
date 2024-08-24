extends Sprite2D

@onready var parent = $".."

@export var max_len = 200 #how far the knob can go
@export var dead_zone = 25 #area in the middle of the knob that doesn't do anything
@export var snap_back = 20 #how quickly it snaps back after being released

var pressing = false

func _ready():
	max_len *= parent.scale.x

func _process(delta):
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= max_len:
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle) * max_len
			global_position.y = parent.global_position.y + sin(angle) * max_len
		calculate_vector()
	else:
		global_position = lerp(global_position, parent.global_position, delta * snap_back)
		parent.posVector = Vector2.ZERO
func calculate_vector():
	if abs((global_position.x - parent.global_position.x)) >= dead_zone:
		parent.posVector.x = (global_position.x - parent.global_position.x)/max_len
	if abs((global_position.y - parent.global_position.y)) >= dead_zone:
		parent.posVector.y = (global_position.y - parent.global_position.y)/max_len
func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
