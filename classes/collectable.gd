extends Area2D

@export var itemRes: InventoryItem

@onready var inventory = preload("res://assets/inventory/inventory.tres") 

var isPlayerNear = false

func collect():
	inventory.insert(itemRes)
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		isPlayerNear = true


func _on_body_exited(body):
	if body.name == "Player":
		isPlayerNear = false
		
func _input(event):
	if event.is_action_pressed("take"):
		if isPlayerNear:
			collect()
