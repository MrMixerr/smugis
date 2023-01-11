extends KinematicBody2D

export var speed := 200
var player = null
const gravity = 5000
var velocity = Vector2.ZERO




func movemnt(delta):
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
	movemnt(delta)


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		
		$AnimationPlayer.play("Moving")
		player = body

func _on_Area_death_body_entered(body):
	var random_shift = randi() % 20
	if body.is_in_group("Bullet"):
		GameInfo.score = GameInfo.score + 5
		if random_shift >= 10:
			GameInfo.health = GameInfo.health + 1
			GameInfo.bullets = GameInfo.bullets + 6
		queue_free()
