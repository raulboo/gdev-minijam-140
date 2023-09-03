extends Area2D
class_name Egg

@onready var kill_timer = $KillTimer
@export var speed : int = 5
var direction := Vector2.ZERO

func _ready():
	kill_timer.start()

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity
		
	

func set_direction(direction: Vector2, rotation: float):
	self.direction = direction
	self.rotation = rotation


func _on_kill_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("enemy"): 
		body.queue_free()
		queue_free()
