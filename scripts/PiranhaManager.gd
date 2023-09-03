extends Node2D

@export var Piranha : PackedScene
@onready var player = $/root/World/Entities/Player
@onready var rng = RandomNumberGenerator.new()

func _ready():
	$SpawnTimer.timeout.connect(spawn_piranha)
	
func spawn_piranha():
	var piranha_position = define_piranha_position()
	
	# spawn the piranha in the defined position
	var pir = Piranha.instantiate()
	pir.position = piranha_position
	get_parent().add_child(pir)

func define_piranha_position():
	# calculate a piranha_position that's not too close to the player
	var piranha_position
	var player_position = player.position;
	var max_distance = 75
	# define distance 0 as a placeholder,
	# but note declaring it inside the loop would also be fine
	var distance = 0
	var is_too_close = true;
	while (is_too_close):
		piranha_position = Vector2(rng.randi_range(0,320),rng.randi_range(0,240))
		distance = player_position.distance_to(piranha_position)
		is_too_close = (distance < max_distance)
	return piranha_position
