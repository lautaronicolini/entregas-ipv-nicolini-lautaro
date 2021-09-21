extends Sprite

export (float) var ACCELERATION = 20.0
export (float) var H_SPEED_LIMIT = 600.0
export (float) var FRICTION_WEIGHT = 0.1

var projectile_container:Node
var velocity:Vector2 = Vector2.ZERO

onready var cannon:Sprite = $Cannon

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container
	
func _physics_process(delta):
	# Manera optimizada
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))

	if direction_optimized != 0:
		velocity.x = clamp(velocity.x + (direction_optimized * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)	
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0

	position += velocity * delta
	
	if Input.is_action_just_pressed("fire_cannon"):
		cannon.fire()
