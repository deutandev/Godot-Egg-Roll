extends Node2D


const BOMB = preload("res://src/Player/Bomb.tscn")
onready var score_label = $Control/CanvasLayer/VBoxContainer/ScoreLabel
onready var highscore_label = $Control/CanvasLayer/VBoxContainer/HighScoreLabel
onready var bombs_label = $Control/CanvasLayer/VBoxContainer/HBoxContainer/BombsCountLabel
onready var player_pos = $PlayerNode.position
const OBSTACLE = preload("res://src/Obstacles/Obstacle.tscn")
const OBS = preload("res://src/Obstacles/Obstacle2.tscn")
const UFO = preload("res://src/Obstacles/UFO/UFO.tscn")
var obs_list = [OBSTACLE, OBS]


func _ready():
	Global.current_score = 0
	Global.obs_speed = 350
	Global.bombs = 0
	highscore_label.text = "High Score: " + str(Global.high_score)
	get_random_spawn_time()


func _physics_process(delta):
	shoot()


func get_random_spawn_time():
	randomize()
	return rand_range(0.7, 3)


func _on_ObstacleTimer_timeout():
	var obs = obs_list[randi() % obs_list.size()].instance()
	obs.position.y = player_pos.y
	add_child(obs)
	$ObstacleTimer.wait_time = get_random_spawn_time()


func _on_ScoreTimer_timeout():
	Global.current_score += 1


func _process(delta):
	score_label.text = "Score: " + str(Global.current_score)
	bombs_label.text = " : " + str(Global.bombs) + "/" + str(Global.bombs_bag)


func shoot():
	if Input.is_action_just_pressed("shoot"):
		if Global.bombs > 0:
			$ShootAudio.play()
			var bomb = BOMB.instance()
			bomb.position = $PlayerNode/Player.global_position
			add_child(bomb)
			Global.bombs -= 1
