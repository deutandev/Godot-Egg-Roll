extends Area2D


func _process(delta):
	position.x -= 400 * delta


func _on_ObstacleTimer_timeout():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Obstacle_body_entered(body):
	get_tree().quit()
