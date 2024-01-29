extends CanvasLayer

var score = 0

func _ready():
	$HBoxContainer/ScoreValue.text = str(score)


func _on_player_score_updated(value:Variant):
	score = value
	$HBoxContainer/ScoreValue.text = str(score)
