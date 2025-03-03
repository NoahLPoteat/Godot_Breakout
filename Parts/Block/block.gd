extends RigidBody2D



@onready var _sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func reset():
	visible = true
	disable_mode
