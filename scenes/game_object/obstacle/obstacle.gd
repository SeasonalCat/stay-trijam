extends CharacterBody2D


@onready var sprite = $Visuals/Sprite2D
@onready var timer = $Timer
var max_speed: int = 400

var textures = [
	preload("res://assets/leaf.png"),
	preload("res://assets/news.png"),
	preload("res://assets/oakleaf.png"),
	preload("res://assets/paper.png"),
	preload("res://assets/pizza.png"),
	preload("res://assets/trash.png"),
	preload("res://assets/umbrella.png")
]


func _ready():
	var texture = textures[randi() % textures.size()]
	sprite.texture = texture
	$Area2D.body_entered.connect(collide_with_player)
	$Timer.timeout.connect(queue_free)


func _process(delta):
	if (velocity == Vector2.ZERO):
		accelerate_to_player()
	move_and_slide()


func accelerate_to_player():	
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var direction = (player.global_position - global_position).normalized()

	var angle = randf_range(-PI / 40, PI / 40)
	direction = direction.rotated(angle)

	velocity = direction * max_speed


func collide_with_player(other_body: Node2D):
	if other_body.is_in_group("player"):
		queue_free()
		other_body.position += velocity.normalized() * 50

