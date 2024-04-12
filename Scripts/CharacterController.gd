extends CharacterBody2D

@export var MaxSpeed:float = 500.0
@export var Acceleration:float = 100.0
@onready var Cam = $"../Camera2D"
var MousePosition = null

func _physics_process(delta): 
	
	var Motion = Vector2()
	Motion.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	Motion.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	velocity.x = move_toward(velocity.x, Motion.x * MaxSpeed , Acceleration)
	velocity.y = move_toward(velocity.y, Motion.y * MaxSpeed , Acceleration)
	
	if Input.is_action_pressed("Turbo"):
		MaxSpeed = 1000
	else:
		MaxSpeed = 500
		
	move_and_slide()
	
	MousePosition = get_global_mouse_position()
	look_at(MousePosition)
	
	Cam.position = lerp(Cam.position, position, 5 * delta)
