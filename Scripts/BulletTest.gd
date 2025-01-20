# Bullet.gd
extends Node2D

@export var speed = 300
@export var life_span = 3

var velocity = Vector2.ZERO

func _ready():
	velocity = Vector2(cos(rotation), sin(rotation)) * speed
	$Timer.start(life_span)

func _process(delta):
	position += velocity * delta

# Destroy bullet when timer ends
func _on_Timer_timeout():
	queue_free()
