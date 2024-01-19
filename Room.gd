extends Resource

class_name Room

var position: Vector2i
var height: int
var width: int
var pointId: int
var corners : Array[Vector2i]
var center: Vector2i # Центр, но не в тайловых координатах, а в обычных

func _init(position, height, width):
	self.position = position
	self.height = height
	self.width = width
	center = Vector2i(position.x * 16 + width * 8, position.y * 16 + height * 8)
	corners = []
	corners.append(position)
	corners.append(Vector2i(position.x + width, position.y))
	corners.append(Vector2i(position.x + width, position.y + height))
	corners.append(Vector2i(position.x, position.y + height))
	

