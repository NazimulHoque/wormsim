extends Control
@onready var title = $Panel/Title


var type

func _ready():
	if type == "Quit":
		title.text = "QUIT GAME?"
	if type == "Restart":
		title.text = "RESTART GAME?"

func _on_confirm_pressed():
	if type == "Quit":
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	if type == "Restart":
		get_tree().paused = false
		get_tree().reload_current_scene()
	

func _on_no_pressed():
	get_tree().paused = false
	queue_free()
