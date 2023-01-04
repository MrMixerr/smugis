extends KinematicBody2D

var player_health = GameInfo.health
var pistol_bullet_count = GameInfo.bullets
var speed := GameInfo.player_speed
var weapon = true
const bullet = preload("res://scenes/bullet.tscn")
var shooting_speed := 1000 
export var jump_power := 1100
export var gravity = 2000
var velocity = Vector2.ZERO


func _ready():
	GameInfo.health = 3
	GameInfo.bullets = 30
	GameInfo.score = 0

func movement():
	if GameInfo.health <= 0:
		velocity = Vector2.ZERO
		$".".visible = false
		GameInfo.bullets = 0
		
	look_at(get_global_mouse_position())
	velocity.x = 0
	if Input.is_action_pressed("A"):
		velocity.x -= speed
		get_node("Icon").set_flip_h(true)
	if Input.is_action_pressed("D"):
		velocity.x += speed
		get_node("Icon").set_flip_h(false)
	if Input.is_action_pressed("W"):
		if is_on_floor():
			velocity.y = -jump_power
	shoot()
	
func shoot():
	if Input.is_action_just_pressed("ATTACK") and GameInfo.bullets > 0:
		var bullet_shot = bullet.instance()
		bullet_shot.position = $Position2D.get_global_position()
		bullet_shot.rotation_degrees = rotation_degrees
		bullet_shot.apply_impulse(Vector2(), Vector2(shooting_speed, 0).rotated(rotation))
		GameInfo.bullets = GameInfo.bullets - 1
		get_tree().get_root().add_child(bullet_shot)
		

func _process(delta):
	movement()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		GameInfo.health = GameInfo.health - 1
		get_tree().create_timer(1.0)
	
