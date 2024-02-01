extends CharacterBody2D

# var velocity = Vector2(0, 0)
signal score_updated(value)
signal lives_updated(value)

var gravity = 2000
var score = 0
@export var lives = 3

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -1000
		$AnimatedSprite.play("Jump")
		$AudioStreamPlayer2D.play()

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

func update_score(value: int):
	score += value
	emit_signal("score_updated", score)
	# print(score)


func _on_fall_area_body_entered(_body:Node2D):
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	# get_tree().reload_current_scene()

func _on_finish_area_body_entered(_body:Node2D):
	get_tree().change_scene_to_file("res://scenes/level_01.tscn")

func take_damage():
	lives -= 1
	$AnimatedSprite.play("Hurt")
	set_modulate(Color(1, 0.3, 0.3, 0.6))
	emit_signal("lives_updated", lives)
	$Timer.start()
	if lives == 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_timer_timeout():
	set_modulate(Color(1, 1, 1, 1))
