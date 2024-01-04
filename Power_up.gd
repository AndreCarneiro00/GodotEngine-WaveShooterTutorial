extends Sprite2D

@export var player_variable_modify: String
@export var player_variable_set: float
@export var power_up_cool_down: float

func _on_hitobox_area_entered(area):
	if area.is_in_group("Player"):
		area.get_parent().set(player_variable_modify, player_variable_set)
		area.get_parent().get_node("Power_up_cool_down").wait_time = 2
		area.get_parent().get_node("Power_up_cool_down").start()
		area.get_parent().power_up_reset.append(name)
		queue_free()
