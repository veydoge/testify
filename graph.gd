extends Node2D

class_name Graph_drawer

var graph: AStar2D


func _init(graph: AStar2D):
	self.graph = graph
	
func _draw():
	draw_graph()
func draw_graph():
	if (graph != null):
		for pointId in graph.get_point_ids():
			var currentpos = graph.get_point_position(pointId)
			for pointConnection in graph.get_point_connections(pointId):
				var connectPointPos = graph.get_point_position(pointConnection)
				draw_line(currentpos, connectPointPos, Color("33FF99"))
				
				
