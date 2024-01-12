extends Area2D

func _ready():
	$AnimationPlayer.play("coin_animation")

func _on_body_entered(body:Node2D):
    
	body.update_score()
	queue_free()
