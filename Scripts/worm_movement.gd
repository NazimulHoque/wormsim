extends CharacterBody2D

var speed = 1000

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_just_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_just_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_just_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_just_pressed("ui_down"):
		direction.y += 1
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * speed
		look_at(position + (direction * 90))
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
