extends Control

func _ready():
	$TextureRect/VBoxContainer/PlayButton.grab_focus()	

func _process(delta):
	pass
	
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://first_scene.tscn") # for trial

func _on_upgrade_button_pressed():
	print("Add Upgrade!") # for trial

func _on_options_button_pressed():
	pass

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://credits.tscn")
	

func _on_quit_button_pressed():
	get_tree().quit()
