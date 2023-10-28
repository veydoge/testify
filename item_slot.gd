extends Panel

@onready var backgroundSprite: Sprite2D = $background
@onready var itemsprite: Sprite2D = $CenterContainer/Panel/item2d

func update(item: InventoryItem):
	if !item:
		backgroundSprite.frame = 0
		itemsprite.visible = false
	else:
		backgroundSprite.frame = 1
		itemsprite.visible = true
		itemsprite.texture = item.texture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
