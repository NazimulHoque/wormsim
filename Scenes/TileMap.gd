extends TileMap






# Called when the node enters the scene tree for the first time.

func _on_visible_on_screen_entered() -> void:
	var newTile = self.duplicate()
	if newTile:
		#print(newTile)
		newTile.global_translate(Vector2(0,-1728))
		get_parent().add_child(newTile)
		#print(newTile.get_child(5))
	


func _on_visible_on_screen_exited() -> void:
	#print("deleted ")
	#print(self)
	queue_free()
