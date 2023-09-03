extends Node2D

@export var Piranha : PackedScene

@onready var rng = RandomNumberGenerator.new()
func _ready():
	$SpawnTimer.timeout.connect(spawn_piranha)
	
	
func spawn_piranha():
	var pir = Piranha.instantiate()
	pir.position=Vector2(rng.randi_range(0,320),rng.randi_range(0,240))
	add_child(pir)
	

