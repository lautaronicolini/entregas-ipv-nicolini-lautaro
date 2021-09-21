extends Node

func _ready():
	$Player.set_projectile_container(self)
	$TurretSpawn.put_turrets($Player, self)
