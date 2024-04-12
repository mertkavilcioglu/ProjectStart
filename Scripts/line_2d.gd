extends Line2D
class_name Trails

var queue : Array
@export var MAX_LENGTH : int

func _ready():
	queue = []
	set_process(true)

func _process(delta): 							# BUNU MUHTEMELEN _PHYSICS_PROCESS'E  CEVIRMEN GEREKECEK, 
	var pos = get_parent().get_global_transform().origin	# CEVIRDIGIN ZAMAN TRAIL DAHA UZUN GOZUKUYOR
	queue.push_front(pos)						# TRAIL UZUNLUGU line_2d.tscn OBJESININ Trails>Max Length
	if queue.size() > MAX_LENGTH:				# COMPONENTINDEN AYARLANIYOR  **Particles\line_2d.tscn
		queue.pop_back()
	
	clear_points()
	
	for point in queue:
		add_point(point)
