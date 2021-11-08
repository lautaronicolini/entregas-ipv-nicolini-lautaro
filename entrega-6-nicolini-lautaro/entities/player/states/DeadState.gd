extends "res://entities/AbstractState.gd"

func enter():
	parent._play_animation("dead")
	parent.notify_death()

func update(delta):
	parent._handle_deacceleration()
	parent._apply_movement()
	

func _on_animation_finished(anim_name:String):
	parent._remove()
