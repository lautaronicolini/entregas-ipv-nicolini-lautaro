extends Node

export var turret_scene:PackedScene
export var projectile_scene:PackedScene

func put_turrets(target, procetile_container):
	var viewport = get_viewport()
	
	for i in range(3):
		var turret = turret_scene.instance()
		turret.set_values(projectile_scene, target, procetile_container)		
		randomize()
		turret.position.x = rand_range(0, viewport.get_visible_rect().size.x)
		turret.position.y = rand_range(0, viewport.get_visible_rect().size.y - target.position.y)
		self.get_owner().add_child(turret)
		turret._ready()
