extends Control

var active = false
func _ready():
	self.visible = false
	active = false
	back()

func activate():
	if active == false and Input.is_action_just_pressed("Debug"):
		self.visible = true
		active = true
	elif active == true and Input.is_action_just_pressed("Debug"):
		self.visible = false
		active = false
func back():
	$Coins.visible = false
	$Player.visible = false
	$Main.visible = true

func _process(delta):
	activate()

func _on_Coins_pressed():
	$Coins.visible = true
	$Main.visible = false
func _on_Enemy_pressed():
	pass # Replace with function body.
func _on_Player_pressed():
	$Main.visible = false
	$Player.visible = true
	
func _on_Coins_remove_pressed():
	GameInfo.coins = 0


func _on_Coins_add_pressed(): 
	var input_text = $Coins/Coins_text.get_text()
	GameInfo.coins = input_text
	
	

func _on_Coins_back_pressed():
	back()


func _on_Health_back_pressed():
	back()


func _on_Health_remove_pressed():
	GameInfo.health = 3


func _on_Speed_remove_pressed():
	GameInfo.player_speed = 300 


func _on_Bullets_remove_pressed():
	pass # Replace with function body.


func _on_Speed_add_pressed():
	var input_text = $Player/Speed_add.get_text()
	GameInfo.player_speed = input_text


func _on_Bullets_add_pressed():
	var input_text = $Player/Bullets_add.get_text()
	GameInfo.bullets = input_text



func _on_Score_add_pressed():
	var input_text = $Player/Score_add.get_text()
	GameInfo.score = input_text


func _on_Health_add_pressed():
	var input_text = $Player/Health_add.get_text()
	GameInfo.Health = input_text
