
extends Sprite

var vx = randi() % 200 + 50
var vy = randi() % 200 + 50
var ay = 980

func _ready():
	set_process(true)
	
	var pos = get_pos()
	pos.x = 50
	pos.y = 50
	set_pos(pos)


func _process(delta):
	var pos = get_pos()
	
	pos.x += vx * delta
	pos.y += vy * delta
	
	vy += ay * delta
	
	if pos.x > 800:
		vx = -vx
		pos.x = 800
		
	elif pos.x < 0:
		vx = abs(vx)
		pos.x = 0
		
	elif pos.y > 600:
		vy *= -0.85 
		pos.y = 600
		if randf() > 0.5:
			vy = -(rand_range(50,1150))
		
	elif pos.y < 0:
		vy = 0
		pos.y = 0
	
	set_pos(pos)