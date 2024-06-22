extends TileMap




func _on_visible_on_screen_enabler_2d_screen_entered():
	var newTile = self.duplicate()
	newTile.global_translate(Vector2(0,-648))
	
	get_parent().add_child(newTile)
	


func _on_visible_on_screen_enabler_2d_screen_exited():
	#pass
	queue_free()
