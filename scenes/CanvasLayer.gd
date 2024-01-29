extends CanvasLayer

var score = 0

func _ready():
	$HBoxContainer/ScoreValue.text = str(score)


func _on_player_score_updated(value:Variant):
	score = value
	$HBoxContainer/ScoreValue.text = str(score)


func _on_character_body_2d_lives_updated(value:Variant):
	var lives = int(value)
	if(lives == 2):
		$LivesContainer/Heart3.visible = false
	elif(lives == 1):
		$LivesContainer/Heart2.visible = false
	elif(lives == 0):
		$LivesContainer/Heart1.visible = false
