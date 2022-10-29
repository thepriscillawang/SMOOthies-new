extends Node2D

func _ready():
	print("Hi, world!")
	$WelcomeMusic.stream = load("res://sounds/HawaiiDrum.wav")
	$WelcomeMusic.play()
	
func _load_Main():
	var Main = SceneLoader._load_scene("Main")
	Main.name = "Main"

func _on_StartButton_pressed():
	_play_sound()

func _play_sound():
	$StartButtonSound.stream = load("res://Sounds/softbutton.wav")
	$StartButtonSound.connect("finished", self, "_load_intro_scene")
	$StartButtonSound.play()

func _load_intro_scene():
#	get_tree().change_scene("res://Intro.tscn") 
	SceneLoader._change_scene("Intro")
