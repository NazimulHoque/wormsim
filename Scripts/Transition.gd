extends ColorRect
@onready var anim = $AnimationPlayer

signal animation_complete

func fade_out():
	anim.play("Fade Out")
	
func fade_in():
	anim.play("Fade In")
	


func _on_animation_player_animation_finished(anim_name):
	animation_complete.emit()
