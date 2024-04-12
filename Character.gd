extends CharacterBody2D

#character attributes

var health:int = 100
var damage: int = 1
var speed: float = 500.0
var fuel: float = 100.0
@onready var body = $body
@onready var wing = $wing

#upgrade

@onready var LevelPanel = get_node("Upgrade/NewLevel")
var level_counter = 1


	
func LevelUp():
	level_counter+=1
	get_tree().paused = true
	LevelPanel.visible = true
	
	if level_counter == 2:
		body.texture = load("res://uzaygemisi/gövdeler/gövde lvl2.png")
		wing.texture = load("res://uzaygemisi/kanatlar/kanat lvl2 gövde 1.png")
	if level_counter == 3:
		body.texture = load("res://uzaygemisi/gövdeler/gövde lvl3.png")
		wing.texture = load("res://uzaygemisi/kanatlar/kanat lvl3 gövde 1.png")
	if level_counter == 4:
		body.texture = load("res://uzaygemisi/gövdeler/gövde lvl4.png")
		wing.texture = load("res://uzaygemisi/kanatlar/kanat lvl4 gövde 1.png")
	if level_counter == 5:
		body.texture = load("res://uzaygemisi/gövdeler/gövde lvl5.png")
		wing.texture = load("res://uzaygemisi/kanatlar/kanat lvl5 gövde 1.png")
		
	
	
func _on_get_level_pressed(): 
	LevelUp()


func _on_health_pressed():
	health+=10
	get_tree().paused = false
	LevelPanel.visible = false
	


func _on_speed_pressed():
	speed+=100.0
	get_tree().paused = false
	LevelPanel.visible = false
	


func _on_fuel_pressed():
	fuel+=10.0
	get_tree().paused = false
	LevelPanel.visible = false


func _on_damage_pressed():
	damage+=1
	get_tree().paused = false
	LevelPanel.visible = false

