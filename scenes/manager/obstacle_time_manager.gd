extends Node

class_name ObstacleTimeManager

signal obstacle_difficulty_increased(obstacle_difficulty: int)

const DIFFICULTY_INTERVAL = 5

@onready var timer = $Timer

var obstacle_difficulty = 0

func _ready():
	timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	obstacle_difficulty += 1
	obstacle_difficulty_increased.emit(obstacle_difficulty)
