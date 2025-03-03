extends Node2D

@onready var _score: Label = $Score
@onready var _lives: Label = $Lives

@export var score: int

@export var max_lives: int = 3
var current_lives: int
var multiplier: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_lives = max_lives
	score = 0
	update_score()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score():
	_score.text = str(score)

func _on_ball_block_hit():
	score += 100 * multiplier
	multiplier *= 1.1
	update_score()
