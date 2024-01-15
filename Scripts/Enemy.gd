extends CharacterBody2D

var speed = 100
var direction = -1

func _ready():
	$AnimationPlayer.play("Running")

func _physics_process(_delta):
	velocity = Vector2(speed * direction, 0)
	move_and_slide()
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = not $Sprite2D.flip_h
