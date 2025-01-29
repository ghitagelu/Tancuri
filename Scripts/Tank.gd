extends Node2D

# Variables for tank movement
var speed = 300
var rotation_speed = 3

# Variables for shooting
var bullet_scene = preload("res://Scenes/Bullet.tscn")
var fire_rate = 2.5
var last_fire_time = 0
var can_shoot = true

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

	# Handle shooting with fire rate control
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot_bullet()
		can_shoot = false
		await get_tree().create_timer(fire_rate).timeout
		can_shoot = true

func shoot_bullet():
	# Instantiate bullet
	var bullet = bullet_scene.instantiate()
	
	# Set bullet position and rotation based on turret
	bullet.global_transform = $TankTurret/Marker2D.global_transform
	
	# Add bullet to scene
	get_parent().add_child(bullet)
