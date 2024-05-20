extends Node2D
class_name GameZone

var radius = 250

@onready var collision_shape = $Area2D/CollisionShape2D

signal out_of_zone

func _ready():
	collision_shape.shape.radius = radius
	$Area2D.area_exited.connect(on_body_exited)


func _draw():
	draw_circle(Vector2.ZERO, radius, Color(1, 1, 1, 0.5))

func on_body_exited(other_body: Node2D):
	out_of_zone.emit()

