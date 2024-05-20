extends CharacterBody2D


@onready var sprite = $Visuals/Sprite2D
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

func _process(_delta):
	if (velocity == Vector2.ZERO):
		accelerate_to_player()
	
	move_and_slide()

func accelerate_to_player():	
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var direction = (player.global_position - global_position).normalized()

	var angle = randf_range(-PI / 20, PI / 20)
	direction = direction.rotated(angle)

	velocity = direction * max_speed

