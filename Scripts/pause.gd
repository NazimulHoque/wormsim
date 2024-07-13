extends Control

@onready var sound_label = $"Panel/Sound Label"
@onready var sounds = $Panel/Sounds
@onready var pause_panel = $Panel
@onready var canv = get_tree().get_first_node_in_group("Canvas")

var sound_on = true

var warning = preload("res://Scenes/warning.tscn")
var sound_on_texture = preload("res://UI/Audio.svg")
var sound_off_texture = preload("res://UI/Audio_OFF.svg")
var main_menu = "res://Scenes/main_menu.tscn"
func _ready():
	pause_panel.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property(pause_panel, "scale", Vector2(1,1), 0.15).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	get_tree().paused = true


func _on_restart_pressed():
	var war = warning.instantiate()
	war.type = "Restart"
	canv.add_child(war)
	queue_free()
#	get_tree().paused = false
#	get_tree().reload_current_scene()


func _on_quit_pressed():
	var war = warning.instantiate()
	war.type = "Quit"
	canv.add_child(war)
	queue_free()
#	get_tree().paused = false
#	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_sounds_pressed():
	if sound_on == true:
		sounds.texture_normal = sound_off_texture
		#DO SOUND OFF STUFF
		sound_label.text = "SOUND: OFF"
		sound_on = false
	else:
		sounds.texture_normal = sound_on_texture
		#DO SOUND ON STUFF
		sound_label.text = "SOUND: ON"
		sound_on = true
		
		


func _on_close_pressed():
	get_tree().paused = false
	queue_free()
