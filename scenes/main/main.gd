extends Node

@export var game_over_scene: PackedScene

@onready var game_zone = $Zone as GameZone
@onready var music_player = $AudioStreamPlayer


func _ready():
	game_zone.out_of_zone.connect(on_player_out_of_zone)
	music_player.finished.connect(on_loop_sound.bind(music_player))


func on_player_out_of_zone():
	var game_over_scene = game_over_scene.instantiate()
	add_child(game_over_scene)


func on_loop_sound(player: AudioStreamPlayer):
	player.playing = true
	player.stream_paused = false
	
