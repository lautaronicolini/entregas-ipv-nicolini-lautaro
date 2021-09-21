extends Sprite

onready var fire_position:Position2D = $FirePosition
export var projectile_scene:PackedScene

var projectile_container:Node

func _physics_process(delta):
	look_at(get_global_mouse_position())

func fire():
	var projectile_instance:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position, (fire_position.global_position - global_position).normalized())

func _on_Turret_visibility_changed(projectile):
	projectile_container.remove_child(projectile)
