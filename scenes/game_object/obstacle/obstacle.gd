extends CharacterBody2D


@onready var sprite = $Visuals/Sprite2D


# variable containing list of possible textures
var textures = [
	preload("res://assets/leaf.png"),
	preload("res://assets/news.png"),
	preload("res://assets/oakleaf.png"),
	preload("res://assets/paper.png"),
	preload("res://assets/pizza.png"),
	preload("res://assets/trash.png"),
	preload("res://assets/umbrella.png")
]

# pick a texture at random on loading
func _ready():
	var texture = textures[randi() % textures.size()]
	sprite.texture = texture

