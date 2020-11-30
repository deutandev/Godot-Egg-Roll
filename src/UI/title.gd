extends Control


func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
	else:
		get_tree().paused = false
	if Global.current_score > Global.high_score:
		Global.high_score = Global.current_score
	$HighScore.text = "High score: " + str(Global.high_score)


func _process(delta):
	if Input.is_action_just_pressed("jump") or Input.is_action_just_pressed("shoot") or Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://src/Main/Main.tscn")
