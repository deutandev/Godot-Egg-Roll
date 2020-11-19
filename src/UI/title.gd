extends Control


func _ready():
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	$HighScore.text = "High score: " + str(Global.high_score)


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://src/Main/Main.tscn")
