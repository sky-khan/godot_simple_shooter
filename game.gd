extends Node2D

var view_size : Vector2
var player_scn = preload("res://player.tscn")
var ufo_scn = preload("res://ufo.tscn")

var score = 0
var player
var ufo
var player_speed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	view_size = get_viewport_rect().size
	player = player_scn.instance()
	player.translate(Vector2(view_size.x/2,view_size.y-64))
	player.connect("on_hit_enemy",self,"player_hit_enemy")
	add_child(player)
	
	ufo = ufo_scn.instance()
	ufo.translate(Vector2(100,100))
	add_child(ufo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_select"):
		if player.can_shoot:
			var bullet = player.shoot()	
			add_child(bullet)
	if Input.is_action_pressed("ui_left"):
		if player.position.x>32.0: # 32: player.width/2
			player.position = Vector2(player.position.x-delta*player_speed,player.position.y)
	if Input.is_action_pressed("ui_right"):
		if player.position.x<view_size.x-32.0:
			player.position = Vector2(player.position.x+delta*player_speed,player.position.y)

func player_hit_enemy(enemy):
	print_debug(str("Player hit an ", enemy.name))
	score += 1
	$HUD.set_score(score)
	
	