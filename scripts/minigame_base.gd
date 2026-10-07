# minigame_base.gd
class_name MiniGameBase
extends Control
signal finished

@export var data: MiniGameData
@onready var dialogue = $DialogueBox   # your own box: label + character portrait
var index := 0

func _ready():
	for line in data.intro_dialogue:
		await dialogue.say(line)       # say() waits until the player taps
	show_question()

func show_question():
	var q = data.questions[index]
	await dialogue.say(q.prompt_dialogue)
	setup_question(q)                  # each game overrides this

func setup_question(q: QuestionData):
	pass
func submit_answer(is_correct: bool):
	var q = data.questions[index]
	if not is_correct:
		await dialogue.say(q.wrong_dialogue)
	else:
		await dialogue.say(q.right_dialogue)
	index += 1
	if index >= data.questions.size():
		finished.emit()                # your sim game listens to this
	else:
		show_question()
