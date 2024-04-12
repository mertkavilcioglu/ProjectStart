extends CharacterBody2D

@onready var all_interactions = []
@onready var interactLabel = $"Interaction Components/InteractLable"

func _physics_process(delta):

	if Input.is_action_just_pressed("interact"):
		execute_interaction()

func _on_interaction_area_area_entered(area):
	all_interactions.insert(0, area)
	update_interactions()

func _on_interaction_area_area_exited(area):
	all_interactions.erase(area)
	update_interactions()

func update_interactions():
	if all_interactions:
		interactLabel.text = all_interactions[0].interact_label
	else:
		interactLabel.text = ""

func _ready():
	update_interactions()

func execute_interaction():
	if all_interactions:
		var cur_interaction = all_interactions[0]
		match cur_interaction.interact_type:
			"print_text" : print(cur_interaction.interact_value)

var press_start_time = 0
func _process(delta):
	# Check for keyboard input
	if Input.is_action_pressed("interact"):
		# Interaction button ('E') is pressed, record start time
		press_start_time = Time.get_ticks_msec()
	elif Input.is_action_just_released("interact"):
		# Interaction button ('E') is released, calculate press time
		var press_end_time = Time.get_ticks_msec()
		var press_time = press_end_time - press_start_time
		print("Button Press Time: ", press_time, " milliseconds")
