extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for item in GameManager.itens_comprados:
		if GameManager.itens_comprados[item] == false:
			get_node("Room").get_node(item).hide()
			
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

