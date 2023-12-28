extends Sprite2D

var speed = 75
var velocity = Vector2()

var stun = false
var hp = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.player != null and stun == false:
		velocity = global_position.direction_to(Global.player.global_position)
	elif stun:
		velocity = lerp(velocity, Vector2(), 0.3)
	
	global_position += velocity * speed * delta
	
	if hp <= 0:
		queue_free()

func _on_hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		modulate = Color.WHITE
		velocity = -velocity * 6
		hp -= 1
		stun = true
		$Stun_timer.start()
		area.get_parent().queue_free()


func _on_stun_timer_timeout():
	modulate = Color("f9133e")
	stun = false
