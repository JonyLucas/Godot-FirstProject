extends CharacterBody2D

var speed = 100
var direction = -1

func _ready():
	$AnimationPlayer.play("Running")

func _physics_process(_delta):
	velocity = Vector2(speed * direction, 0)
	move_and_slide()
	if is_on_wall() or !$RayCast2D.is_colliding():
		direction *= -1
		$Sprite2D.flip_h = not $Sprite2D.flip_h
		$RayCast2D.position.x *= -1


func _on_collision_checker_body_entered(body:Node2D):
	print("enter enemy")
	body.lives = body.lives - 1
	print("Player lives: " + str(body.lives))
	if body.lives == 0:
		get_tree().reload_current_scene()
