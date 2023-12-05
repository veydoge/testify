extends Resource

class_name Room

var position: Vector2i
var height: int
var width: int

func _init(position, height, width):
	self.position = position
	self.height = height
	self.width = width
