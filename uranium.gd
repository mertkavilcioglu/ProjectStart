extends Area2D

var uranium_count = 0

func _on_body_entered(body):
	if body.name == "Player":
		uranium_count += 1
		self.queue_free()
