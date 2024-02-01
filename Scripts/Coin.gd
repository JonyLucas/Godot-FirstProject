extends Area2D

enum coin_enum {SILVER_COIN, RED_COIN, GOLD_COIN}
@export var coint_type: coin_enum

func _ready():
	$AnimationPlayer.play("coin_animation")

func _on_body_entered(body:Node2D):
	var value = 0
	if coint_type == coin_enum.SILVER_COIN:
		value = 1
	elif coint_type == coin_enum.RED_COIN:
		value = 5
	elif coint_type == coin_enum.GOLD_COIN:
		value = 10
	
	$CoinCollectionSound.play()
	$AnimationPlayer2.play("collect")
	$CollisionShape2D.set_deferred("disabled", true)
	body.update_score(value)
	$Timer.start()


func _on_timer_timeout():
	queue_free()
