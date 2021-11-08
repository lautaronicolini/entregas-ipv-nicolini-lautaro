extends Node

onready var player = $Environment/Player
onready var bgm_player = $BackgroundMusicPlayer

func _ready():
	randomize()
	player.initialize(self)

func _unhandled_input(event):
	if event.is_action("restart"):
		_restart_level()

func _restart_level():
	get_tree().reload_current_scene()

func _on_Player_dead():
	bgm_player.stream = load("res://assets/audio/bgm/gameOver.ogg")
	bgm_player.stream.set_loop(false)
	bgm_player.play()
