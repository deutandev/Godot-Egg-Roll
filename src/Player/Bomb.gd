extends KinematicBody2D


var velocity = Vector2()


func _ready():
	velocity.x = 400


func _physics_process(delta):
	move_and_slide(velocity)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
