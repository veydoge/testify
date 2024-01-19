extends CharacterBody2D

const speed = 200
var enemy_inattack_range = false
var enemy_attak_cooldown = true
var player_alive = true
var attack_ip = false
var current_dir = "none"
var canpick = true
var spawn_position : Vector2
var health = 100
var Direction
@onready var inventory = preload("res://assets/inventory/inventory.tres")
@onready var animatedSprite : AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta):
	World.pos = position
	if (velocity.x == 0):
		animatedSprite.play("idle")
	Direction = Input.get_vector("leftmove", "rightmove", "upmove", "downmove")

func _physics_process(delta):
	if (velocity.x == 0):
		animatedSprite.play("idle")
	
	var Direction = Input.get_vector("leftmove", "rightmove", "upmove", "downmove")
	if (Direction != Vector2.ZERO):
		velocity.x = Direction.x * speed	
		velocity.y = Direction.y * speed
		if (velocity.x < 0):
			current_dir = "going"
			animatedSprite.play("going")
			$sword.rotation_degrees = 180
			animatedSprite.flip_h = true
		if (velocity.x > 0):
			current_dir = "going"
			animatedSprite.play("going")
			$sword.rotation_degrees = 0
			animatedSprite.flip_h = false
		if (velocity.y < 0):
			current_dir = "up"
			animatedSprite.play("up")
			animatedSprite.flip_h = false
		if (velocity.y > 0):
			current_dir = "down"
			animatedSprite.play("down")
			animatedSprite.flip_h = false
	else:
		velocity.x= move_toward(velocity.x, 0, speed)
		velocity.y= move_toward(velocity.y, 0, speed)
	move_and_slide()
	enemy_attack()
	attack()
	update_health()
	
	if health == 0:
		player_alive = false 
		World.player_health = 0
		print("player has been killed")
		get_tree().change_scene_to_file("res://panel.tscn")
	
		
func player():
	pass

func update_health():
	var healthbar = $ProgressBar 
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
		
func _on_timer_timeout():
	if health < 100:
		health = health + 20
		if health > 100:
			health = 100
	if health <= 0:
		health = 0

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range and enemy_attak_cooldown == true:
		health = health - 10
		enemy_attak_cooldown = false
		$attack_cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_attak_cooldown = true
	
func attack():
	var air = current_dir
	if Input.is_action_just_pressed("attack"):
		World.player_current_attack = true
		attack_ip = true
		if air == "going":
			$deal_attack_timer.start()
		if air == "down":
			$deal_attack_timer.start()
		if air == "up":
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	World.player_current_attack = false
	attack_ip = false
	
func _on_area_2d_area_entered(area: Area2D):
	if (area.has_method("collect")):
		area.collect(inventory)