class_name Level
extends Node2D

var score = 0
var score_timer: float = 0.0

signal score_changed(score)

static var speed = 75


@onready var game_ui = $"CanvasLayer/Game UI"
@onready var anim = $CanvasLayer/ColorRect/AnimationPlayer
@onready var worm = get_tree().get_first_node_in_group("Worm")
func _ready():
	set_physics_process(false)
	worm.disable_movement()
	anim.play("Fade_In")
	

func _process(delta):
	score_update(delta)
	global_position.y += speed * delta 


func score_update(delta):
	score_timer += delta
	if score_timer >= 0.5:
		score += 1
		score_timer = 0.0
		score_changed.emit(score)
		game_ui.update_height(score)



func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Fade_In":
		game_ui.update_height(score)
		set_physics_process(true)
		worm.enable_movement()

