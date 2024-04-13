extends Node2D

@onready var lasers = $Lasers
@onready var player = $Character
@onready var enemies = $Enemies

func _ready():
	player.connect("laser_shot", _on_player_laser_shot)
	
func _physics_process(delta):
	for enemy in enemies.get_children():
		enemy.connect("laser_shot", _on_enemy_laser_shot)
	
func _on_player_laser_shot(laser):
	lasers.add_child(laser)
	
func _on_enemy_laser_shot(laser):
	lasers.add_child(laser)

func _on_enemy_hit():
	pass
