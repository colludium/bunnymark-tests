extends Node2D
var bunny = preload('res://bunny.scn')
var bunnyCount = 0
var elapsed = 0
var NODE_fps
var NODE_bunnyCount
var fps
var BunnySpawnIterator
var BunnyInstance

func _ready():
    # Initalization here
    NODE_fps = get_node("fps")
    NODE_bunnyCount = get_node("bunnyCount")
    set_process(true)
    addBunny(10)

func _process(delta):
    if Input.is_action_pressed('mouse_down'):
        addBunny(10)
    elapsed = elapsed + delta
    # Update fps text once per second
    if elapsed > 1:
        fps = OS.get_frames_per_second()
        NODE_fps.set_text("FPS: " + str(fps))
        NODE_fps.set_as_toplevel(1)
        NODE_bunnyCount.set_as_toplevel(1)
        elapsed = 0

func addBunny(n):
    BunnySpawnIterator = 0
    while BunnySpawnIterator < n:
        BunnySpawnIterator += 1
        BunnyInstance= bunny.instance()
        add_child(BunnyInstance)
        bunnyCount = bunnyCount + 1
    var count = "Bunnies: " + str(bunnyCount)
    NODE_bunnyCount .set_text(count)
