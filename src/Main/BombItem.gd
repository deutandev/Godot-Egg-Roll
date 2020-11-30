extends Area2D



func _on_BombItem_body_entered(body):
	if Global.bombs <= Global.bombs_bag:
		Global.bombs += 1
	queue_free()


func _process(delta):
	rotate(30)
	position.x -= Global.obs_speed * delta
