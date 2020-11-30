extends Node2D


const BOMB_ITEM = preload("res://src/Main/BombItem.tscn")


func _on_BombSpawnTimer_timeout():
	var bomb_obj = BOMB_ITEM.instance()
	bomb_obj.position.y = rand_range(300, 450)
	bomb_obj.position.x = 1500
	add_child(bomb_obj)
	$BombSpawnTimer.wait_time = rand_range(15, 20)
 
