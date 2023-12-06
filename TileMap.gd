extends TileMap

var projectResolution
var projectTilesRes
var RoomArray = []

# Called when the node enters the scene tree for the first time.
func _ready():
	get_screen_transform()
	projectResolution= get_viewport().get_visible_rect().size
	projectTilesRes = Vector2(ceilf(projectResolution.x / 16), ceilf(projectResolution.y / 16))
	
	
	for i in range(projectTilesRes.x):
		for j in range(projectTilesRes.y):
			set_cell(0, Vector2(i, j), 6, Vector2(6, 8), 0)	                                                                                                                                                                                                                                                                                                                                                                                                                          

	
	for i in range(3):
		make_an_island(randi_range(0, projectTilesRes.x), randi_range(0, projectTilesRes.y))
			

			

	pass # Replace with function body.
	
func make_an_island(x, y):
	var height = randi_range(2, 6)
	var width = randi_range(2, 6)
	var newRoom = Room.new(Vector2i(x, y), height, width)
	for createdRoom in RoomArray:
		if (room_intersect(createdRoom, newRoom)):
			return
	RoomArray.append(newRoom)

	
	for i in range(height):
		for j in range(width):
			set_cell(0, Vector2(x + i, y + j), 0, Vector2(0, 0), 0)
			
	
func room_intersect(room1: Room, room2: Room):
	var intersected = false
	for corner in room1.corners:
		if (corner.x >= room2.position.x and corner.x <= room2.position.x + room2.width) and (corner.y >= room2.position.y and corner.y <= room2.position.y + room2.height):
			intersected = true
			return intersected
	return intersected
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

