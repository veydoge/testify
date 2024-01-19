extends Node2D

var GraphPoints

func _draw():

	if GraphPoints != null:
		var pointIds = GraphPoints.get_point_ids()
		for pointId in pointIds:
			for connectedPointId in GraphPoints.get_point_connections(pointId):
				var positionPoint = GraphPoints.get_point_position(pointId)
				var positionConnectedPoint = GraphPoints.get_point_position(connectedPointId)
				draw_line(positionPoint, positionConnectedPoint, Color.RED, 2)
	$"../TileMap".connect_rooms()
	$"../TileMap".connect_rooms2()
	

func _process(delta):
	pass
