extends StaticBody2D


var velocity = Vector2()

func _process(delta):
	look_at(get_global_mouse_position())
