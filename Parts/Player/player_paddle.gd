extends CharacterBody2D
@export var speed: float = 500.0
@export var y_constant: int = 472

@export var x_low_bound: int = 64
@export var x_high_bound: int = 448

var target: Vector2

func _physics_process(delta):
	#both y inputs are not needed as we are locked to the x axids
	var input_direction: Vector2 = Input.get_vector("player_left", "player_right", " ", " ")
	
	velocity = input_direction * speed
	global_position.y = y_constant
	
	move_and_slide()
	
	
	
	#everything commented is for use with AnimatableBody2D
	#if input_direction.x == 1:
		#move_right(delta)
	#elif input_direction.x == -1:
		#move_left(delta)
	#elif input_direction.x == 0:
		#move_stop


#func move_right(delta: float):
	#
	#target.y = y_constant
	#target.x = global_position.x + 50
	#target.x = clamp(target.x, x_low_bound, x_high_bound)
	#global_position = global_position.move_toward(target, delta * speed)
#
#func move_left(delta: float):
	#target.y = y_constant
	#target.x = global_position.x - 50
	#target.x = clamp(target.x, x_low_bound, x_high_bound)
	#global_position = global_position.move_toward(target, delta * speed)
#
#func move_stop(delta: float):
	#target.y = y_constant
	#target.x = global_position.x
	#target.x = clamp(target.x, x_low_bound, x_high_bound)
	#global_position = global_position.move_toward(target, delta * speed)
	#rotation = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
