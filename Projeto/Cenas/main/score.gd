extends Label

func _process(delta):
	text = "COIN: " + str(GameManager.score)
