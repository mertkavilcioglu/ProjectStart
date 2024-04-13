extends CharacterBody2D

@export var MaxSpeed:float = 500.0
@export var Acceleration:float = 100.0
@onready var Cam = $"../Camera2D"
var MousePosition = null
@onready var CanBoost:bool = true
@onready var BoostRefuel:bool = false
@onready var BoostFuel:float = 100.0
@onready var muzzle=$Muzzle 
var laser_scene = preload("res://Scenes/laser.tscn")
signal laser_shot(laser)
var BoostCD:int = 3
var shoot_bas=false

func _process(delta): 
	if Input.is_action_pressed("Shoot"):
		if !shoot_bas:
			shoot_bas=true
			shoot_laser()
			await get_tree().create_timer(0.5).timeout
			shoot_bas=false

func _physics_process(delta): 
	print(BoostFuel)
	if BoostFuel <100:
		BoostFuel += 10*delta
	
	var Motion = Vector2()
	Motion.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	Motion.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	velocity.x = move_toward(velocity.x, Motion.x * MaxSpeed , Acceleration)
	velocity.y = move_toward(velocity.y, Motion.y * MaxSpeed , Acceleration)
	
	if Input.is_action_pressed("Turbo"):
		if BoostRefuel == false:
			if BoostFuel <0:
				BoostRefuel = true
			if BoostFuel > 0:
				if CanBoost == true:
					MaxSpeed = 3000
					velocity.x = move_toward(velocity.x, Motion.x * MaxSpeed , Acceleration*100)
					velocity.y = move_toward(velocity.y, Motion.y * MaxSpeed , Acceleration*100)
					BoostFuel -= 20
					CanBoost = false
				elif CanBoost == false:
					MaxSpeed = 1500
					if BoostFuel > 0:
						BoostFuel -= 50*delta
					else: 
						MaxSpeed = 500
			else:
				MaxSpeed = 500
		elif BoostRefuel == true:
			if BoostFuel < 100:
				BoostFuel += 50*delta
			else:
				BoostRefuel = false
	else:
		MaxSpeed = 500
	if Input.is_action_just_released("Turbo"):
		if BoostFuel > 20:
			CanBoost = true


	move_and_slide()
	MousePosition = get_global_mouse_position()
	look_at(MousePosition)
	Cam.position = lerp(Cam.position, position, 5 * delta)
	
func Boost_True():
	CanBoost = true
	print ("bum")
	
func shoot_laser():
	var l = laser_scene.instantiate()
	l.global_position = muzzle.global_position
	l.rotation = rotation + PI/2
	emit_signal("laser_shot", l)
	
