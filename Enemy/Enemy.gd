extends CharacterBody2D

func dropLoot():
	var uranium_item = load("res://uranium.tscn").instantiate()
	get_tree().root.add_child(uranium_item)
	uranium_item.global_position = self.position
