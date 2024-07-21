extends CharacterBody2D
@onready var joy_stick = get_tree().get_first_node_in_group("Joystick")
@export var speed: float = 500
@export var rotation_speed: float = 7.0
var direction: Vector2 = Vector2.ZERO


func _physics_process(delta):
	if joy_stick:
		direction = joy_stick.posVector
		if direction:
			var target_rotation = direction.angle() + PI / 2
			rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
			velocity = direction * speed
		else:
			velocity = Vector2.ZERO
		move_and_slide()
