extends Area2D


func _on_UFO_body_entered(body):
	destroy()


func _process(delta):
	position.x -= 500 * delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_UFO_area_entered(area):
	destroy()

func destroy():
	$DestroyedAudio.play()
	$ExplodeParticles.emitting = true
	$ExplodeParticles2.emitting =true
	#queue_free()
