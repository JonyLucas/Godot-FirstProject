extends CharacterBody2D

# var velocity = Vector2(0, 0)
var gravity = 2000

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -1000
		$AnimatedSprite.play("Jump")

	if Input.is_action_pressed("left_arrow"):
		velocity.x = -300
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = true #Flips the sprite horizontally
	elif Input.is_action_pressed("right_arrow"):
		velocity.x = 300
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
	else:
		velocity.x = 0
		$AnimatedSprite.play("Idle")

	if not is_on_floor():
		$AnimatedSprite.play("Jump")

	velocity.y += gravity * _delta # The sum makes the vector points down
	move_and_slide() # Godot function that moves the character and makes it slide on slopes
	# velocity.x = lerp(velocity.x, 0, 0.1)
