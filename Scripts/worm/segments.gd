extends CharacterBody2D
@export var speed: float = 600
@export var follow_distance: float = 150
@export var rotation_speed: float = 10
var follow_target: Node2D


func follow(target: Node2D):
	follow_target = target
	
func _physics_process(delta):
	if follow_target:
		var target_position = follow_target.position
		var distance = position.distance_to(target_position)
		
		if distance > follow_distance:
			var direction = (target_position - position).normalized()
			var target_rotation = direction.angle() + PI / 2
			rotation = lerp_angle(rotation, target_rotation, rotation_speed * delta)
			velocity = direction * speed
			move_and_slide()
		else:
			velocity = Vector2.ZERO
