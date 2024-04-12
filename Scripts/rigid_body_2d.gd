class_name Enemy #NEW ********************************
extends RigidBody2D

signal hit() #NEW ********************************
var enemyHealth:int = 3 #NEW ********************************
var playerDamage:int = 1 #NEW ********************************

@onready var player = $"../Character"
@export var enemyMaxSpeed: float = 100.0
@export var radius = 150

func _physics_process(delta):
	var enemyMotion = Vector2()

	enemyMotion.x = (player.position.x + radius) - self.position.x
	enemyMotion.y = (player.position.y + radius) - self.position.y

	linear_velocity.x = enemyMaxSpeed * enemyMotion.x * delta
	linear_velocity.y = enemyMaxSpeed * enemyMotion.y * delta

func getHit(): #NEW ********************************
	emit_signal("hit") #NEW ********************************
	if enemyHealth > 1: #NEW ********************************
		enemyHealth -= 1 #NEW ********************************
	elif enemyHealth <= 1: #NEW ********************************
		queue_free() #NEW ********************************
