extends ParallaxBackground

func _process(delta):
	scroll_offset.x -= Global.obs_speed * delta
