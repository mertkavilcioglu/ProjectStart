class_name Enemy 
extends RigidBody2D

signal hit() 
var enemyHealth:int = 3 
var playerDamage:int = 1 

@onready var player = $"../../Character"
@export var enemyMaxSpeed: float = 100.0
@export var radius = 150

var laser_scene = preload("res://Scenes/laser.tscn")
@onready var muzzle1=$Muzzle 
signal laser_shot(laser)

func _physics_process(delta):
	var enemyMotion = Vector2()

	enemyMotion.x = (player.position.x + radius) - self.position.x
	enemyMotion.y = (player.position.y + radius) - self.position.y

	linear_velocity.x = enemyMaxSpeed * enemyMotion.x * delta
	linear_velocity.y = enemyMaxSpeed * enemyMotion.y * delta
	
	look_at(player.position)
	
	
var shoot_bas=false

func _process(delta): 
	if !shoot_bas:
		shoot_bas=true
		shoot_to_player()
		await get_tree().create_timer(0.5).timeout
		shoot_bas=false

func getHit(): 
	emit_signal("hit") 
	if enemyHealth > 1: 
		enemyHealth -= 1 #
	elif enemyHealth <= 1:
		queue_free()
		
func shoot_to_player():
	var l = laser_scene.instantiate()
	l.global_position = muzzle1.global_position
	l.rotation = rotation + PI/2
	emit_signal("laser_shot", l)
		
