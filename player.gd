extends CharacterBody2D
const speed = 300
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var inventory = preload("res://assets/inventory/inventory.tres") 




func _physics_process(delta):
	if (velocity.x == 0):
		animatedSprite.play("idle")
	
	
	var Direction = Input.get_vector("leftmove", "rightmove", "upmove", "downmove")
	if (Direction != Vector2.ZERO):
		velocity.x = Direction.x * speed	
		velocity.y = Direction.y * speed
		if (velocity.x < 0):
			animatedSprite.play("going_left")
			animatedSprite.flip_h = false
		if (velocity.x > 0):
			animatedSprite.play("going_left")
			animatedSprite.flip_h = true
	else:
		velocity.x= move_toward(velocity.x, 0, speed)
		velocity.y= move_toward(velocity.y, 0, speed)
	move_and_slide()
		
	pass
	
	





func _on_area_2d_area_entered(area: Area2D):
	if (area.has_method("collect")):
		area.collect(inventory)