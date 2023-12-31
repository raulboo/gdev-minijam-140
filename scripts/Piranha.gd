extends CharacterBody2D


const SPEED = 50

@onready var player = $/root/World/Entities/Player
@onready var animation = ""

func _physics_process(delta):
	# move towards player
	var dpos = position.direction_to(player.position)
	velocity = dpos*SPEED
	move_and_slide()
	
	# restart the scene if player is too close
	var distance = player.position.distance_to(position)
	var max_distance = 11
	if (distance < max_distance):
		get_tree().reload_current_scene()
		
	if velocity:
		animation = "walk"
	else:
		animation = "idle"
	$"AnimatedSprite2D".play(animation)
