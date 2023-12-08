extends Resource

class_name Room

var position: Vector2i
var height: int
var width: int
var corners : Array[Vector2i]
var center: Vector2i

func _init(position, height, width):
	self.position = position
	self.height = height
	self.width = width
	center = Vector2i((position.x + width) / 2, (position.y + height) / 2 )
	
	corners = []
	corners.append(position)
	corners.append(Vector2i(position.x + width, position.y))
	corners.append(Vector2i(position.x + width, position.y + height))
	corners.append(Vector2i(position.x, position.y + height))
