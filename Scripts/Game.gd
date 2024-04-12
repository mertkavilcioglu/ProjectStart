extends Node2D

@onready var lasers = $Lasers
@onready var player = $Character
@onready var enemies = $Enemies

func _ready():
	player.connect("laser_shot", _on_player_laser_shot)
	
	for enemy in enemies.get_children():
		enemy.connect("hit", _on_enemy_hit)
	
func _on_player_laser_shot(laser):
	lasers.add_child(laser)

func _on_enemy_hit():
	pass
