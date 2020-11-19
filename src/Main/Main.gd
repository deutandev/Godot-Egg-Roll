extends Node2D



const OBSTACLE = preload("res://src/Obstacles/Obstacle.tscn")
# var player_pos = $PlayerNode.position

func _on_ObstacleTimer_timeout():
	var obs = OBSTACLE.instance()
	obs.position.y = $PlayerNode.position.y
	add_child(obs)
