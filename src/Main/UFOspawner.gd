extends Node2D



const UFO = preload("res://src/Obstacles/UFO.tscn")


func _on_SpawnTimer_timeout():
	var ufo_obj = UFO.instance()
	ufo_obj.position.y = rand_range(300, 450)
	ufo_obj.position.x = 1500
	add_child(ufo_obj)
	$SpawnTimer.wait_time = rand_range(5, 90) * 10
