extends Control

signal opened
signal closed

@onready var inventory = preload("res://assets/inventory/inventory.tres") 
@onready var slots: Array = $GridContainer.get_children()
var IsOpen = false
# Called when the node enters the scene treze for the first time.
func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		slots[i].update(inventory.slots[i])
		
func _ready():
	inventory.updated.connect(update)	
	update()
	

func open():
	visible = true
	IsOpen = true
	opened.emit()
	
func close():
	visible = false
	IsOpen = false
	closed.emit()
	
