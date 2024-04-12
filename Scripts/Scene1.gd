extends Node2D

@onready var lasers= $Lasers
@onready var character=$Character


func _ready():
	character.connect("Laser_shoot", _on_character_laser_shot)


func _on_character_laser_shot(laser):
	lasers.add_child(laser)
	
	
	
	
	
