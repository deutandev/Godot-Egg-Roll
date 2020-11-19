extends Area2D

var obs_speed = 350


func _process(delta):
	position.x -= obs_speed * delta
	if Global.current_score % 50 == 0:
		obs_speed += 1


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
