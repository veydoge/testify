extends Node2D

@onready var inventory = preload("res://assets/inventory/inventory.tres")
@onready var slots: Array[InventorySlot] = inventory.slots

func _input(event):
	if event.is_action_pressed("1_inventory"):
		inventory.update_current_slot(slots[0])
	elif event.is_action_pressed("2_inventory"):
		inventory.update_current_slot(slots[1])
	elif event.is_action_pressed("3_inventory"):
		inventory.update_current_slot(slots[2])
	elif event.is_action_pressed("4_inventory"):
		inventory.update_current_slot(slots[3])
	elif event.is_action_pressed("5_inventory"):
		inventory.update_current_slot(slots[4])

func _on_inventory_gui_closed():
	get_tree().paused = false

func _on_inventory_gui_opened():
	get_tree().paused = true


