extends Sprite2D

var velocity = Vector2(1, 0)
var speed = 250
var damage

var look_once = true

var blood_particles = preload("res://blood_particles.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if look_once:
		look_at(get_global_mouse_position())
		look_once = false
	global_position += velocity.rotated(rotation) * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
