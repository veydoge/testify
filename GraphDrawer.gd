extends Node2D


# Called when the node enters the scene tree for the first time.
func _draw():
	
	var GraphPoints = $"../TileMap".GraphPoints
	if GraphPoints != null:
		var pointIds = GraphPoints.get_point_ids()
		for pointId in pointIds:
			for connectedPointId in GraphPoints.get_point_connections(pointId):
				var positionPoint = GraphPoints.get_point_position(pointId)
				var positionConnectedPoint = GraphPoints.get_point_position(connectedPointId)
				draw_line(positionPoint, positionConnectedPoint, Color.RED, 2)
	

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
