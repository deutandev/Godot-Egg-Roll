extends Control

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		get_tree().change_scene("res://src/Main/Main.tscn")
