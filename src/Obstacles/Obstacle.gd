extends Area2D

var obs_speed = 400
func _process(delta):
	position.x -= obs_speed * delta



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
