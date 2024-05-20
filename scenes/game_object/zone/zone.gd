extends Node2D
class_name GameZone

var radius = 250

@onready var collision_shape = $Area2D/CollisionShape2D

signal out_of_zone

func _ready():
	collision_shape.shape.radius = radius
	$Area2D.body_exited.connect(on_body_exited)


func _draw():
	draw_circle(Vector2.ZERO, radius, Color(1, 1, 1, 0.5))

func on_body_exited(other_body: Node2D):
	if other_body.is_in_group("player"):
		out_of_zone.emit()

