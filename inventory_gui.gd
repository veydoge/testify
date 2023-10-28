extends Control

signal opened
signal closed

@onready var Inventory = preload("res://assets/inventory/inventory.tres")

var IsOpen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open():
	visible = true
	IsOpen = true
	opened.emit()
	
func close():
	visible = false
	IsOpen = false
	closed.emit()
	
