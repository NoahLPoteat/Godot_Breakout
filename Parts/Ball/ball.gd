extends CharacterBody2D

signal block_hit
var target: Vector2  
@export var speed = 250.0
var local_col_point

@export var ramp: float = 1


func _physics_process(delta):
	
	if velocity != Vector2.ZERO:
		velocity = velocity.move_toward(velocity, speed * delta)
	else:
		velocity = Vector2.ZERO
	
	# Handle launching the ball from the paddle
	
	
	
	var col = move_and_collide(velocity * (delta * speed))
	
	if col:
		handle_collision(col)
	
	

func handle_collision(collision: KinematicCollision2D):
	
	velocity = velocity.bounce(collision.get_normal())
	
	var collided_OBJ: Object = collision.get_collider()
	
	print(collided_OBJ.get_class())
	
	if collided_OBJ.get_class() == "CharacterBody2D":
		local_col_point = (collided_OBJ.get_global_position().x + 52 - collision.get_position().x)
		if local_col_point > 4:
			velocity.x = calc_local_col_percent(local_col_point)
		elif local_col_point < 4:
			velocity.x = calc_local_col_percent(local_col_point)
		elif local_col_point == 0:
			pass
		
	if collided_OBJ.get_class() == "RigidBody2D":
		block_hit.emit()
		#collided_OBJ.visible = false
		collided_OBJ.queue_free()
	
	
	#add check to see if ball has hit a brick, then emit signal
	#increase speed, break block, and increase score
	
	

func calc_local_col_percent(col_point):
	return (col_point / 48) * -1 

#launches the ball from the paddle
func launch():
	if velocity == Vector2.ZERO:
		velocity = (Vector2(0, 1))

func _process(delta: float) -> void:
	if Input.is_action_pressed("player_space"):
		launch()

func _on_debug_timer_timeout():
	print("Velocity :", velocity)
	print("local col", local_col_point)

func reset():
	global_position.x = 256
	global_position.y = 464
	velocity = Vector2.ZERO


func _on_arena_ball_entered_lose():
	reset()
