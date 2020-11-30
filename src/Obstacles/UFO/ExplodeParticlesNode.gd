extends Node2D


func _ready():
	$ExplodeParticles.emitting = true
	$ExplodeParticles2.emitting = true


func _process(delta):
	position.y += 200
