extends Node2D

signal ball_entered_lose

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_lose_zone_body_entered(body):
	ball_entered_lose.emit()
