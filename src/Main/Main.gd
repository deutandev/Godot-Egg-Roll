extends Node2D



const OBSTACLE = preload("res://src/Obstacles/Obstacle.tscn")

func _on_ObstacleTimer_timeout():
	var obs = OBSTACLE.instance()
	add_child(obs)
