extends Area2D


func _on_UFO_body_entered(body):
	queue_free()


func _process(delta):
	position.x -= 500 * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
