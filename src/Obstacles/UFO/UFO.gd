extends KinematicBody2D


var destroyed = false


func _on_UFO_body_entered(body):
	destroy()


func _process(delta):
	position.x -= 500 * delta


func _physics_process(delta):
	if destroyed == true:
		$CollisionShape2D.disabled = true
		$Area2D/CollisionShape2D.disabled = true
		rotation_degrees -= 5
		fall()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	destroy()


func destroy():
	$DestroyedAudio.play()
	$ExplodeParticles.emitting = true
	$ExplodeParticles2.emitting = true
	destroyed = true


func fall():
	move_and_slide(Vector2(0, 100))
