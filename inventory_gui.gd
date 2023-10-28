extends Control

signal opened
signal closed

@onready var Inventory = preload("res://assets/inventory/inventory.tres") 
@onready var slots: Array = $GridContainer.get_children()
var IsOpen = false
# Called when the node enters the scene treze for the first time.
func update():
	for i in range(min(Inventory.items.size(), slots.size())):
		slots[i].update(Inventory.items[i])
		
func _ready():
	print("123")
	update()
	

func open():
	visible = true
	IsOpen = true
	opened.emit()
	
func close():
	visible = false
	IsOpen = false
	closed.emit()
	
