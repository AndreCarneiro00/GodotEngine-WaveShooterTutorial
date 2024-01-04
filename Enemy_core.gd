extends Sprite2D

@export var speed: int = 75
var velocity = Vector2()

@export var hp: int = 3
@export var knockback: int = 600
@export var point: int = 1
var stun = false

@onready var current_color = modulate

var blood_particles = preload("res://blood_particles.tscn")

func check_hp():
	if hp <= 0:
		Global.points += point
		if Global.node_creation_parent != null:
			var blood_particles_instance = Global.instance_node(blood_particles, global_position, Global.node_creation_parent)
			blood_particles_instance.rotation = velocity.angle()
			blood_particles_instance.modulate = Color.from_hsv(current_color.h, current_color.s, 0.5)
		queue_free()

func basic_movement_toward_player(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
		global_position += velocity * speed * delta
	elif stun:
		velocity = lerp(velocity, Vector2(), 0.3)
		global_position += velocity * delta

func _on_hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager") and stun == false:
		modulate = Color.WHITE
		velocity = -velocity * knockback
		hp -= area.get_parent().damage
		stun = true
		$Stun_timer.start()
		area.get_parent().queue_free()

func _on_stun_timer_timeout():
	modulate = current_color
	stun = false
