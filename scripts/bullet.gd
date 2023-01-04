extends RigidBody2D

# var boom = preload("res://scenes/boom.tscn") 

func _on_bullet_body_entered(body):
	if !body.is_in_group("Player"):
		queue_free()
	
