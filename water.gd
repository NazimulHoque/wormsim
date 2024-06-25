extends TileMap

func _ready():
	#var visOnScr = get_node('VisibleOnScreenEnabler2D')
	#print(visOnScr)
	#if visOnScr:
		#how to connect signals
		#visOnScr.screen_entered.connect(_on_visible_on_screen_enabler_2d_screen_entered)
		#visOnScr.screen_exited.connect(_on_visible_on_screen_enabler_2d_screen_exited)
	pass

func _on_visible_on_screen_entered() -> void:
	var newTile = self.duplicate()
	if newTile:
		print(newTile)
		newTile.global_translate(Vector2(0,-648))
		get_parent().add_child(newTile)
		print(newTile.get_child(6))
	


func _on_visible_on_screen_exited() -> void:
	print("deleted ")
	print(self)
	queue_free()
