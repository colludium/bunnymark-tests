extends Sprite
var v = Vector2(randi() % 200 + 50,randi() % 200 + 50 )
const ay = 980
var pos

func _ready():
    set_pos(Vector2(50,50))
    pos = get_pos()
    set_process(true)

func _process(delta):
    v.y += ay * delta
    pos += Vector2(v) * delta
    if pos.y > 600:
        v.y *= -0.85 
        pos.y = 600
        if randf() > 0.5:
            v.y = -(rand_range(50,1150))
    elif pos.y < 0:
        v.y = 0
        pos.y = 0   
    elif pos.x > 800:
        v.x = -v.x
        pos.x = 800
    elif pos.x < 0:
        v.x = abs(v.x)
        pos.x = 0
    set_pos(pos)
