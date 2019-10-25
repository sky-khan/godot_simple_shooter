extends Area2D

signal on_hit_enemy 
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered",self,"bullet_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y>0:
		position.y = position.y-delta*speed
	else:
		queue_free()

func bullet_entered(body):
	emit_signal("on_hit_enemy",body)
	queue_free()
