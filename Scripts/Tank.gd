# AZ Tank-like game in Godot (Starter Project)
# This script sets up a basic tank movement and shooting system.

extends Node2D

# Variables for tank movement
var speed = 300
var rotation_speed = 3

# Variables for shooting
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var fire_rate = 0.5
var last_fire_time = 0
var bullet_speed = 12
var bullet_lifetime = 10
var can_shoot = true

func _ready():
	# Set up anything necessary when the scene starts
	pass

func _process(delta):
	# Handle tank movement
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_left"):
		rotation -= rotation_speed * delta
	if Input.is_action_pressed("ui_right"):
		rotation += rotation_speed * delta

	# Move the tank forward or backward
	var direction = Vector2(0, -1).rotated(rotation)
	position += direction * input_vector.y * speed * delta

	# Handle shooting
	if Input.is_action_pressed("shoot") :
		shoot_bullet()

func shoot_bullet():
	# Instantiate and shoot a bullet
	var bullet = bullet_scene.instantiate()
	bullet.position = $TankTurret/Marker2D.global_position
	bullet.rotation = $TankSprite.global_rotation 
	get_parent().add_child(bullet)
