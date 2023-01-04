extends Control

var player_health = GameInfo.health
func _ready():
	show()
func _process(delta):
	$Info/Health.text = "Health: " + str(GameInfo.health)
	$Info/Bullets.text = "Bullets: " + str(GameInfo.bullets)
	$Info/Coin.text = "Coins: " + str(GameInfo.coins)
	show()

func show():
	if GameInfo.health <= 0:
		$Death.visible = true
		$Info.visible = false
	else: 
		$Death.visible = false
		$Info.visible = true


func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/Menu.tscn")

func _on_Restart_pressed():
	get_tree().change_scene("res://scenes/Test.tscn" )
