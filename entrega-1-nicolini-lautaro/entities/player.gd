extends Sprite
export var velocidad = 50
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direccion = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	position.x += velocidad * direccion * delta
