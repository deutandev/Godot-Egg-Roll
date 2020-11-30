extends KinematicBody2D

#Jump 
export var fall_gravity_scale := 200.0
export var low_jump_gravity_scale := 180.0
export var jump_power := 700.0
var jump_released = false

#Physics
var velocity = Vector2()
var earth_gravity = 10 # m/s^2
export var gravity_scale := 100.0
var on_floor = false

onready var dust = get_parent().get_node("Dust")

func _physics_process(delta):
	if Input.is_action_just_released("jump"):
		jump_released = true
		dust.emitting = false

	#Applying gravity to player
	velocity += Vector2.DOWN * earth_gravity * gravity_scale * delta

	#Jump Physics
	if velocity.y > 0: #Player is falling
		#Falling action is faster than jumping action | Like in mario
		#On falling we apply a second gravity to the player
		#We apply ((gravity_scale + fall_gravity_scale) * earth_gravity) gravity on the player
		velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta 

	elif velocity.y < 0 && jump_released: #Player is jumping 
		#Jump Height depends on how long you will hold key
		#If we release the jump before reaching the max height 
		#We apply ((gravity_scale + low_jump_gravity_scale) * earth_gravity) gravity on the player
		#It result on a lower jump
		velocity += Vector2.DOWN * earth_gravity * low_jump_gravity_scale * delta

	if on_floor:
		if Input.is_action_just_pressed("jump"): 
			velocity = Vector2.UP * jump_power #Normal Jump action
			jump_released = false
			$JumpAudio.play()
		dust.emitting = true

	velocity = move_and_slide(velocity, Vector2.UP) 

	if is_on_floor(): 
		on_floor = true
	else: 
		on_floor = false
		dust.emitting = false


func game_over():
	get_tree().change_scene("res://src/UI/title.tscn")


func _on_Area2D_area_entered(area):
	if area.is_in_group("items"):
		pass
	else:
		game_over()
