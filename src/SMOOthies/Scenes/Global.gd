extends Node

var total_days = 14
var req_amount_to_open_store = 100
var special_events = []
var curr_day_num_cups_sold = 0
var curr_day_total_pop = 0

var curr_day = 1
var curr_money
var curr_mango
var curr_pineapple
var curr_dragonfruit
var curr_milk
var curr_ice
var curr_cup

var inventory_mango
var inventory_pineapple
var inventory_dragonfruit
var inventory_milk
var inventory_ice
var inventory_cup

var total_income
var total_expenses

var price_mango = 0.50
var price_pineapple = 0.25
var price_dragonfruit = 0.75
var price_milk = 0.25
var price_ice = 0.25
var price_cup = 0.1

var mango_recipe_amount = 0
var pineapple_recipe_amount = 0
var dragonfruit_recipe_amount = 0
var milk_recipe_amount = 0
var ice_recipe_amount = 0

func reset_curr_ingredients():
	curr_mango = 0
	curr_pineapple = 0
	curr_dragonfruit = 0
	curr_milk = 0
	curr_ice = 0
	curr_cup = 0
	curr_day = curr_day + 1

func _reset_values():
	reset_curr_ingredients()
	curr_day = 1
	curr_money = 100.00
	total_income = 0
	total_expenses = 0
	special_events = []
	reset_inventory()

func reset_inventory():
	inventory_mango = 0
	inventory_pineapple = 0
	inventory_dragonfruit = 0
	inventory_milk = 0
	inventory_ice = 0
	inventory_cup = 0

# a list of special events to generate from
var _events = [
	{event ="King Kamehameha Floral Parade", low = 120, high = 200 }, 
	{event = "Prince Kuhio Festival", low = 120, high = 200}, 
	{event = "Long Weekend", low = 70, high = 90},
	{event = "Ironman Triathlon", low = 100, high = 120},
	{event = "Honolulu Marathon", low = 100, high = 120},
	{event = "Rainy Day", low = 20, high = 40},
	{event = "Brown Water Advisory", low = 30, high = 50},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70},
	{event = "Normal Day", low = 40, high = 70}
]

var ingredient_events = [
	{event = "Bad luck! The milk has spoiled. Make sure to restock!", id = 0},
	{event = "You got an overripe batch of mangoes! You can’t use rotten fruit. Restock.", id =1},
	{event = "Thieving birds! They made off with the dragonfruit! Order more.", id = 2}
]

#generate random events
func _ready():
	print("Global Called")
