extends CanvasLayer

@onready var score_label = $Control/Label
@onready var timer = $Control/Timer

func _ready():		
	Global.tiempo = 0
	
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	timer.start()

func _on_timer_timeout():
	Global.tiempo  += 1	
	score_label.text = str(Global.tiempo )
	
