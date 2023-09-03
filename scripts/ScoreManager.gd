extends Node2D

@onready var total_grass_blocks : int = 0
@onready var Map : Node2D = $/root/World/Map
@onready var ScoreLabel = $/root/World/UI/Score
@onready var score : int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_map_painted_tile():
	score += 100
	ScoreLabel.text = "score: " + str(score)
