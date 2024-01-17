extends CharacterBody2D


var speed = 60.0
@onready var animations = $AnimatedSprite2D
var dead = false
var player_in_area = false
var player
var health = 100
var player_inattack_zone = false
var can_take_damage = true

func _ready():
	dead = false

func _physics_process(delta):
	deal_with_damage()
	update_health()
	if !dead:
		$detection_area/CollisionShape2D.disabled = false
		if player_in_area:
			var dir = player.position - position
			$RayCast2D.target_position = dir
			$RayCast2D.force_raycast_update()
			var collision = move_and_collide($RayCast2D.target_position.normalized() * speed * delta)
			animations.play("jump")
		else:
			animations.play("jump")
	if dead:
		$detection_area/CollisionShape2D.disabled = true


func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_area = true

func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
		
func enemy():
	pass

func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
		
func deal_with_damage():
	if player_inattack_zone and World.player_current_attack == true :
		if can_take_damage == true:
			health = health - 20
			$take_damage_cooldown.start()
			can_take_damage = false
			print("slime health + ", health)
			if health == 0:
				self.queue_free()


func _on_take_damage_cooldown_timeout():
	can_take_damage = true
	
func update_health():
	var healthBar = $healthBar
	healthBar.value = health
		
	if health >= 100:
		healthBar.visible = false
	else:
		healthBar.visible = true
