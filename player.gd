extends Node2D

var bullet_scn = preload("res://bullet.tscn")
var can_shoot = true
var gun_timer 

signal on_hit_enemy 

# Called when the node enters the scene tree for the first time.
func _ready():
	gun_timer = Timer.new()
	gun_timer.connect("timeout",self,"timer_timeout")
	gun_timer.set_wait_time(0.3)
	gun_timer.set_one_shot(true)
	add_child(gun_timer)

func shoot(): 
	can_shoot = false
	gun_timer.start()
	
	var bullet = bullet_scn.instance()
	bullet.position = Vector2(global_position.x,global_position.y-32)
	bullet.connect("on_hit_enemy",self,"bullet_hit_enemy")
	return bullet
	
func bullet_hit_enemy(enemy):
	emit_signal("on_hit_enemy",enemy)

func timer_timeout():
	can_shoot = true