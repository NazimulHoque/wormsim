extends CharacterBody2D

@export var speed: float = 500
@export var rotation_speed: float = 7.0
var direction: Vector2 = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	
	if input_vector.length() > 0:
		direction = input_vector.normalized()
		var target_rotation = direction.angle() + PI / 2
		rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()
