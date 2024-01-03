extends "res://Enemy_core.gd"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	basic_movement_toward_player(delta)
	check_hp()




