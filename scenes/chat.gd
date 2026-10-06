extends Control
@export var message_bubble: PackedScene
@onready var message_list: VBoxContainer = $chat/MessageScroll/MessageList
@onready var reply_list: VBoxContainer = $chat/ReplyList

var file_messages: Array[Dictionary] = [
	{
		"sender": "Mom",
		"text": "Dont forget to come home before 6",
		"day": 1,
		"hour": 8
	},
	{
		"sender": "Mom",
		"text": "Come to the kedai tomorrow",
		"day": 1,
		"hour": 12
	},
	{
		"sender": "Mom",
		"text": "im tiredddd",
		"day": 1,
		"hour": 18
	},
	{
		"sender": "Mom",
		"text": "aaaaa",
		"day": 2,
		"hour": 15
	},
	{
		"sender": "Mom",
		"text": "Dont forget to come home before 6",
		"day": 1,
		"hour": 8
	},
	{
		"sender": "Mom",
		"text": "Come to the kedai tomorrow",
		"day": 2,
		"hour": 12
	},
	{
		"sender": "Mom",
		"text": "im tiredddd",
		"day": 2,
		"hour": 18
	},
	{
		"sender": "Mom",
		"text": "aaaaa",
		"day": 3,
		"hour": 15
	}
]


var file_replies: Dictionary = {
	0: ["yes", "no"],
	1: ["g mau", "yowis"]
}


var current_day: int = 1
var current_hour: int = 0

var shown_message: Array[int] = []
#var player_replies: Array[Dictionary] = []


func _ready() -> void:
	update_chat()

func update_chat() -> void:
	# Get the CURRENT game time every time we update.
	current_day = Global.day
	current_hour = int(Global.hour)


	# Clear old displayed messages.
	for child in message_list.get_children():
		child.queue_free()


	shown_message.clear()


	# Find every message that should already have appeared.
	for message_index in range(file_messages.size()):
		var message: Dictionary = file_messages[message_index]

		var message_day: int = int(message["day"])
		var message_hour: int = int(message["hour"])


		if message_day < current_day or (
			message_day == current_day
			and message_hour <= current_hour
		):
			shown_message.append(message_index)

			create_message(
				str(message["text"])
			)
			# Show player's previous replies.
	#for reply in player_replies:
		#create_message(
			#str(reply["text"])
		#)
#
#
	#update_replies()


func create_message(message_text: String) -> void:
	var bubble = message_bubble.instantiate()
	var label: Label = bubble.get_node("ColorRect/MarginContainer/Label")
	label.text = message_text
	message_list.add_child(bubble)
#
#
#func update_replies() -> void:
	#for child in reply_list.get_children():
		#child.queue_free()
#
#
	#if shown_message.is_empty():
		#return
#
	#var latest_index: int = shown_message[-1]
#
	#if not file_replies.has(latest_index):
		#return
#
#
	#var replies: Array = file_replies[latest_index]
#
#
	#for reply_text in replies:
		#var reply_button := Button.new()
#
		#reply_button.text = str(reply_text)
#
		#reply_button.pressed.connect(
			#_on_reply_pressed.bind(str(reply_text))
		#)
#
		#reply_list.add_child(reply_button)
#
#
#func _on_reply_pressed(reply_text: String) -> void:
	#player_replies.append({
		#"text": reply_text
	#})
#
	#update_chat()
#

func advance_time(new_day: int, new_hour: float) -> void:
	current_day = new_day
	current_hour = int(new_hour)

	update_chat()


func _process(_delta: float) -> void:
	update_chat()
