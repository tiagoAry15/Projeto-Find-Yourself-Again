extends Node2D

class_name Item

export(String) var id
export(int) var increase_health
export(float) var price
export(bool) var comprado

func init(id_value,increase_health_value,price_value,isBought_value):
	id = id_value
	increase_health = increase_health_value
	price = price_value
	comprado = isBought_value
