extends Area2D

var view_size : Vector2
var velocity = 1
var speed = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	view_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (position.x<32) or (position.x>view_size.x-32):
		velocity = -velocity
	position.x += delta*velocity*speed
