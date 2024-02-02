extends Area2D

@export var speed = 10
@export var max_x_positon = 5000
var velocity = Vector2()

func _physics_process(delta):
    position.x += speed * delta
    if position.x > max_x_positon:
        queue_free()


func _on_body_entered(_body:Node2D):
    queue_free()
