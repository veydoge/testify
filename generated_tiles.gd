extends Node2D


# Called when the node enters the scene tree for the first time.
func _draw():
	draw_line(Vector2i(0, 0), Vector2i(1000, 1000), Color.RED, 1)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
