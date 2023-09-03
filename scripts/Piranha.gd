extends CharacterBody2D


const SPEED = 50

@onready var player = $/root/World/Entities/Player


func _physics_process(delta):
	
	var dpos = position.direction_to(player.position)
	
	velocity = dpos*SPEED

	move_and_slide()
