extends Area2D


func _process(delta):
	position.x -= Global.obs_speed * delta
	if Global.current_score % 50 == 0:
		Global.obs_speed += 0.7


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
