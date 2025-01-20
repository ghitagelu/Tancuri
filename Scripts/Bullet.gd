# Bullet script (Bullet.gd)
# Attach this to the Bullet.tscn scene

extends Area2D

# Variables for bullet behavior
var speed = 400

func _process(delta):
	# Move the bullet forward
	position += Vector2(0, -1).rotated(rotation) * speed * delta

	# Remove bullet if it goes offscreen
	if not get_viewport_rect().has_point(global_position):
		queue_free()

func _on_Bullet_body_entered(body):
	# Handle collision with other objects (e.g., other tanks or walls)
	queue_free()
	# Add any other collision logic here

# Input actions
# Add these in the Input Map (Project Settings -> Input Map):
# - "ui_up" for moving forward
# - "ui_down" for moving backward
# - "ui_left" for rotating left
# - "ui_right" for rotating right
# - "shoot" for firing bullets
