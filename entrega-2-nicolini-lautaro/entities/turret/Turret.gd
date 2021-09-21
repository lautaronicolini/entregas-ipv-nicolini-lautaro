extends Sprite

onready var fire_position:Position2D = $FirePosition
var projectile_scene:PackedScene
var target:Sprite
var projectile_container:Node

func _ready():
	$Timer.start()
	
func set_values(projectile, objective, container):
	self.projectile_scene = projectile
	self.target = objective
	self.projectile_container = container
	
func _on_Timer_timeout():
	fire()
	
func fire():
	var projectile_instance:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position, (target.global_position - global_position).normalized())
