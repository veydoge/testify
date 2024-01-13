extends TileMap

var projectResolution
var projectTilesRes
var GraphPoints : AStar2D
var RoomArray = []
var RoomGraph = []

# Called when the node enters the scene tree for the first time.

func _ready():

	get_screen_transform()
	projectResolution= get_viewport().get_visible_rect().size
	# projectTilesRes = Vector2(ceilf(projectResolution.x / 16), ceilf(projectResolution.y / 16))
	projectTilesRes = Vector2(40, 40)
	
	
	GraphPoints = AStar2D.new()

	
	
	for i in range(projectTilesRes.x):
		for j in range(projectTilesRes.y):
			set_cell(0, Vector2(i, j), 6, Vector2(6, 8), 0)                                                                                                                                                                                                                                                                                                                                                                                                             
	
	
	for i in range(8):
		make_an_island(randi_range(0, projectTilesRes.x - 14), randi_range(0, projectTilesRes.y - 14))
	
	$"../GraphDrawer".GraphPoints = GraphPoints

	
	
	
	pass # Replace with function body.
	
func make_an_island(x, y):
	var height = randi_range(6, 14)
	var width = randi_range(6, 14)
	var newRoom = Room.new(Vector2i(x, y), height, width)
	for createdRoom in RoomArray:
		if (room_intersect(createdRoom, newRoom)):
			return
	var id = GraphPoints.get_available_point_id()
	newRoom.pointId = id
	RoomArray.append(newRoom)
	var nearPoint = GraphPoints.get_closest_point(newRoom.center)
	GraphPoints.add_point(id, newRoom.center)
	if (nearPoint != -1):
		GraphPoints.connect_points(id, nearPoint)
	
	
	
	for i in range(width):
		for j in range(height):
			set_cell(0, Vector2(x + i, y + j), 0, Vector2(0, 0), 0)
			
	

	
#func room_intersect(room1: Room, room2: Room): # один из вариантов не учитывал
#	var intersected = false
#	for corner in room1.corners: 
#		# проверяет является ли первый остров, вложенным во второй
#		if (corner.x >= room2.position.x and corner.x <= room2.position.x + room2.width) and (corner.y >= room2.position.y and corner.y <= room2.position.y + room2.height):
#			intersected = true
#			return intersected
#	for corner in room2.corners:
#		# проверяет является ли второй остров, вложенным в первый
#		if (corner.x >= room1.position.x and corner.x <= room1.position.x + room1.width) and (corner.y >= room1.position.y and corner.y <= room1.position.y + room1.height):
#			intersected = true
#			return intersected

func room_intersect(room1: Room, room2: Room):
	if (room2.position.x + room2.width >= room1.position.x and room2.position.x <= room1.position.x + room1.width and room2.position.y + room2.height >= room1.position.y and room2.position.y <= room1.position.y + room1.height):
			return true
	return false
	
signal confirmationCheck


# Called every frame. 'delta' is the elapsed time since the previous frame.
func connect_rooms():
	for point in GraphPoints.get_point_ids():
		await confirmationCheck
		var currentPos = GraphPoints.get_point_position(point)
		currentPos.x = currentPos.x / 16
		currentPos.y = currentPos.y / 16 # ошибка с несколькими коннектнутыми точками
		for connectedPoint in GraphPoints.get_point_connections(point):
			var connectedPos = GraphPoints.get_point_position(connectedPoint)
			connectedPos.x = connectedPos.x / 16
			connectedPos.y = connectedPos.y / 16
			var length = connectedPos - currentPos
			print(length)
			
			var currentRoom : Room = find_room_by_id(point)
			var connectedRoom : Room = find_room_by_id(connectedPoint)
			
			
			
			
			
			var incrementX
			if (length.x > 0):
				incrementX = 1

			else:
				incrementX = -1

			var incrementY
			if (length.y > 0):
				incrementY = 1

			else:
				incrementY = -1

			set_cell(0, currentPos, 6, Vector2i(6, 13), 0)
			var drawingPos = currentPos
			for x in range(ceil(abs(length.x))):
				drawingPos.x += incrementX
				set_cell(0, drawingPos, 6, Vector2i(6, 13), 0)
				
			for y in range(ceil(abs(length.y))):
				drawingPos.y += incrementY
				set_cell(0, drawingPos, 6, Vector2i(6, 13), 0)
				
			GraphPoints.disconnect_points(point, connectedPoint)
		await get_tree().create_timer(1).timeout
			

			
func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		confirmationCheck.emit()
	pass


func find_room_by_id(id: int):
	for room in RoomArray:
		if (room.pointId == id):
			return room
