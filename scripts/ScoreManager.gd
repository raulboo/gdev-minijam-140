extends Node2D

signal score_up(level)

@onready var total_grass_blocks : int = 0
@onready var Map : Node2D = $/root/World/Map
@onready var ScoreLabel = $/root/World/UI/Score
@onready var score : int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_map_painted_tile():
	add_score(100)
	

func add_score(num):
	score+=num
	ScoreLabel.text = "score: " + str(score)
	emit_signal("score_up",floor(sqrt(num)/10))
