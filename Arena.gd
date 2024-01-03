extends Node2D

@export var enemies:Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.node_creation_parent = self
	
	Global.points = 0
	
func _exit_tree():
	Global.node_creation_parent = null


func _on_enemy_spawn_timer_timeout():
	var enemy_position = Vector2(randi_range(-160, 670), randi_range(-90, 390))
	
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > -45:
		enemy_position = Vector2(randi_range(-160, 670), randi_range(-90, 390))
	
	var enemy_number = randi_range(0, enemies.size() - 1)
	
	Global.instance_node(enemies[enemy_number], enemy_position, self)
	

func _on_difficulty_timer_timeout():
	if $Enemy_spawn_timer.wait_time > 0.5:
		$Enemy_spawn_timer.wait_time -= 0.07
	
