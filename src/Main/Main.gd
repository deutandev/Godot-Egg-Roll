extends Node2D


const OBSTACLE = preload("res://src/Obstacles/Obstacle.tscn")
onready var score_label = $Control/CanvasLayer/ScoreLabel


func _ready():
	Global.current_score = 0
	

func _on_ObstacleTimer_timeout():
	var obs = OBSTACLE.instance()
	obs.position.y = $PlayerNode.position.y
	add_child(obs)


func _on_ScoreTimer_timeout():
	Global.current_score += 1


func _process(delta):
	score_label.text = "Score: " + str(Global.current_score)
