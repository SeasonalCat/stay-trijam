extends CanvasLayer

var start_time = 0
@onready var label = $MarginContainer/Label
var current_time = 0


func _ready():
	start_time = Time.get_ticks_msec();


func _process(delta):
	current_time = Time.get_ticks_msec() - start_time
	label.text = format_current_time(current_time)


func format_current_time(time: float):
	return str(time / 1000) + "s"
