extends RigidBody2D

@export var speed: float = 500.0  # Bullet speed
@export var lifetime: float = 3.0  # Bullet lifetime before disappearing

func _ready():
	# Auto-destroy the bullet after 'lifetime' seconds
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta):
	# Move bullet forward in the direction it's facing
	linear_velocity = -transform.y * speed  # Use transform.y to move "forward"
	#linear_velocity = Vector2(0, -1).rotated(rotation) * speed
