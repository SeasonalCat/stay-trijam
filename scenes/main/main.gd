extends Node

@export var game_over_scene: PackedScene

@onready var game_zone = $Zone as GameZone


func _ready():
	game_zone.out_of_zone.connect(on_player_out_of_zone)


func on_player_out_of_zone():
	var game_over_scene = game_over_scene.instantiate()
	add_child(game_over_scene)
