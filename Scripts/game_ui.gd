extends Control

@onready var height_counter = $"Height Counter"
var pause_menu = preload("res://Scenes/pause.tscn")
@onready var canv = get_tree().get_first_node_in_group("Canvas")


func _ready():
	height_counter.text = "HEIGHT: "  + str(0)

func update_height(max_height):
	height_counter.text = "HEIGHT: "  + str(max_height)
	
	


func _on_settings_pressed():
	var pause = pause_menu.instantiate()
	canv.add_child(pause)
