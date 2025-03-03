extends Node2D

@onready var _score: Label = $CanvasLayer/Score
@onready var _lives: Label = $CanvasLayer/Lives
@onready var _lose_menu: Control = $CanvasLayer/LoseMenu


@export var score: int

@export var max_lives: int = 3
var current_lives: int
var multiplier: float = 1.0

signal full_lose

# Called when the node enters the scene tree for the first time.
func _ready():
	current_lives = max_lives
	score = 0
	update_score()
	update_lives()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_score():
	_score.text = str(score)

func update_lives():
	_lives.text = str(current_lives)



func _on_ball_block_hit():
	score += 100 * multiplier
	multiplier *= 1.1
	update_score()


func _on_arena_ball_entered_lose() -> void:
	current_lives -= 1
	update_lives()
	if current_lives <= 0:
		lose_game()
		full_lose.emit()

func lose_game():
	_lose_menu.visible = true
