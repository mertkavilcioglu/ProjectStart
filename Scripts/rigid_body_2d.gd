extends RigidBody2D

@onready var player = $"../Player"
@export var enemyMaxSpeed: float = 100.0
#@export var enemyAcc: float = 1
@export var radius = 150

func _physics_process(delta):
	var enemyMotion = Vector2()

	enemyMotion.x =  (player.position.x + radius) - self.position.x
	enemyMotion.y =  (player.position.y + radius) - self.position.y
	#print(player.position.x)

	linear_velocity.x = enemyMaxSpeed * enemyMotion.x * delta
	linear_velocity.y = enemyMaxSpeed * enemyMotion.y * delta
