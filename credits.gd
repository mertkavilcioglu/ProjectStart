extends Control

func _ready():
	$VideoStreamPlayer/VBoxContainer/BackButton.grab_focus()

func _process(delta):
	pass

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
