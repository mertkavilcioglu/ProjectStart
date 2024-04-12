#class_name Enemy #NEW ********************************
extends Area2D

signal hit() #NEW ********************************
var enemyHealth:int = 3 #NEW ********************************
var playerDamage:int = 1 #NEW ********************************



func getHit(): #NEW ********************************
	emit_signal("hit") #NEW ********************************
	if enemyHealth > 1: #NEW ********************************
		enemyHealth -= 1 #NEW ********************************
		#print(enemyHealth) #NEW ********************************
	elif enemyHealth <= 1: #NEW ********************************
		#print(enemyHealth) #NEW ********************************
		queue_free() #NEW ********************************
	
	#******************************** bu scripte gerek kalmadı usta *******************************
	
