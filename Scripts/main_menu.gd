extends Control
@onready var anim = $AnimationPlayer
@onready var start = $Start
@onready var transition = $Transition

var game_scene = preload("res://Scenes/level.tscn")

func _ready():
	transition.visible = false
	anim.play("Pop In")

func _on_start_pressed():
	anim.play("Pop Out")
	start.disabled = false

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Pop In":
		start.disabled = false
	if anim_name == "Pop Out":
		anim.play("Fade_Out")
	if anim_name == "Fade_Out":
		get_tree().change_scene_to_packed(game_scene)
