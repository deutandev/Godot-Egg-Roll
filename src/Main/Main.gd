extends Node2D


onready var score_label = $Control/CanvasLayer/ScoreLabel
const OBSTACLE = preload("res://src/Obstacles/Obstacle.tscn")
const OBS = preload("res://src/Obstacles/Obstacle2.tscn")
var obs_list = [OBSTACLE, OBS]


func _ready():
	Global.current_score = 0
	Global.obs_speed = 350


func _on_ObstacleTimer_timeout():
	var obs = obs_list[randi() % obs_list.size()].instance()
	obs.position.y = $PlayerNode.position.y
	add_child(obs)
	$ObstacleTimer.wait_time = rand_range(0.5, 3)


func _on_ScoreTimer_timeout():
	Global.current_score += 1


func _process(delta):
	score_label.text = "Score: " + str(Global.current_score)
