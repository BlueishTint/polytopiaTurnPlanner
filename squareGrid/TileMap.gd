extends TileMap
const Camera2d = preload("res://Camera2D.gd")
# Called when the node enters the scene tree for the first time.
var gridSize = 30
var Dic = {}

func _ready():
	for x in gridSize:
		for y in gridSize:
			Dic[str(Vector2(x,y))] = {
				"Type": "Field",
				"Position": Vector2i(x,y)
				
			}
			set_cell(0,Vector2(x,y), 0, Vector2i(0,0),0)
var turegate = false	


func _on_play_pressed():
	turegate = true  # Replace with 
	
func mousepressed(tile):
	

	if (turegate == true ):	
		if Input.is_action_pressed("LEFT_MOUSE_BUTTON"):
			if Dic.has(str(tile)):
				set_cell(0, tile, 2, Vector2i(0,0),0)
				Dic[str(tile)] = {
					"Type": "Forest",
					"Position": tile
				}
		
	
	
	
func _process(delta):
	var positionC2 = get_viewport().get_camera_2d().position
	var mouseposition = get_viewport().get_mouse_position() 
	var tile = local_to_map(mouseposition + positionC2)
	
	for x in gridSize:
		for y in gridSize:
			erase_cell(1, Vector2(x,y))
	
	if Dic.has(str(tile)):
		set_cell(1, tile, 1, Vector2i(0,0),0)
		#print(Dic[str(tile)])
		#print(Dic[str(tile)]["Position"])
		

	mousepressed(tile)
		
		
			
		
	
