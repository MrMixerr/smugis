extends KinematicBody2D

export var speed := 100
var player = null
const gravity = 9000
var velocity = Vector2.ZERO



func movement(delta):
	velocity.x = 0
	if player != null:
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2.ZERO
		
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.ZERO)
func catch():
	pass
func _process(delta):
	catch()
	movement(delta)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func _on_Area_death_body_entered(body):
	var random_shift = randi() % 20
	if body.is_in_group("Bullet"):
		GameInfo.score = GameInfo.score + 100
		if random_shift >= 10:
			GameInfo.health = GameInfo.health + 1
			GameInfo.bullets = GameInfo.bullets + 10
		queue_free()
		print(random_shift)
