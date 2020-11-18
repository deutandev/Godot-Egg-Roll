extends KinematicBody2D


const GRAVITY = 20
const JUMP_SPEED = -600

var velocity = Vector2.ZERO


func _process(delta):
	velocity.y += GRAVITY
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_SPEED
	
	move_and_slide(velocity, Vector2.UP)


func game_over():
	get_tree().quit()


func _on_Area2D_area_entered(area):
	game_over()
