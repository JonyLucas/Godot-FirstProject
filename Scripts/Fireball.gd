extends Area2D

@export var speed = 10
@export var max_x_positon = 5000
var velocity = Vector2()
var turnedRight = true

func _physics_process(delta):
    var direction = -1 if turnedRight else 1
    position.x += speed * delta * direction
    if position.x > max_x_positon:
        queue_free()


func _on_body_entered(body:Node2D):
    body.queue_free()
    queue_free()
