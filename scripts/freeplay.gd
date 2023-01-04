extends Node

onready var player = get_node("Player")
var zombie_var = preload("res://scenes/Zombie.tscn")
var fastcube_var = preload("res://scenes/fastcube.tscn")

func _ready():
	$spawing/Timer.start(1)

func spawn():
	var zombie = zombie_var.instance()
	var fastcube = fastcube_var.instance()
	var spawn_area = get_node("spawing/PathFollow2D")
	var spawn_area2 = get_node("spawing/PathFollow2D")
	spawn_area.offset = randi()
	spawn_area2.offset = randi()
	var direction = spawn_area.rotation + PI / 2
	zombie.position = spawn_area.position
	fastcube.position = spawn_area2.position
	if spawn_area.position == player.position:
		spawn_area.offset = randi()
	add_child(zombie)
	if GameInfo.score >= 1000:
		add_child(fastcube)

func _on_Timer_timeout():
	spawn()
	$spawing/Timer.start(0.9)
	
