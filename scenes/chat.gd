extends Control
@onready var chat: Control = $chat
@onready var message_list: VBoxContainer = $chat/MessageScroll/MessageList
@onready var reply_list: VBoxContainer = $chat/ReplyList

var file_messages : Array[Dictionary]=  [
	{"sender" : "Mom",
	"text": "Dont forget to come home before 6",
	"day": 1,
	"hour" : 8},
	{"sender" : "Mom",
	"text": "Come to the kedai tommorow",
	"day": 1,
	"hour" : 12},
	{"sender" : "Mom",
	"text": "Come to the kedai tommorow",
	"day": 1,
	"hour" : 18},
	
]
var file_replies : Dictionary = {
	0: ["yes", "no"],
	1: ["g mau", "yowis"]
}
var current_day :int = Global.day
var current_hour :int = Global.hour
var shown_message= []
var player_replies = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_chat()
func update_chat() -> void:
	for child in message_list.get_children():
		child.queue_free()
	shown_message.clear()
	for message_index in range(file_messages.size()):
		var message: Dictionary  =file_messages[message_index]
		if message["day"] < current_day or (message["day"] == current_day and message["hour"] <= current_hour):
			if not shown_message.has(message_index):
				shown_message.append(message_index)
				create_message(str(message["sender"]), 
				str(message["text"]))
			for reply in player_replies:
				create_message("you", str(reply["text"]))
			update_replies
func create_message(sender: String, message_text: String) -> void:
	var message_label := Label.new()
	message_label.text = message_text
	message_label.autowrap_mode = TextServer.AUTOWRAP_WORD
	message_list.add_child(message_label)
func update_replies() ->void:
	for child in reply_list.get_children():
		child.queue_free()
	if shown_message.is_empty():
		return
	var latest_index: int = shown_message[-1]
	if not file_replies.has(latest_index):
		return
	var replies: Array  =file_replies[latest_index]
	
	for reply_text in replies:
		var reply_button : = Button.new()
		reply_button.text = str(reply_text)
		reply_button.pressed.connect(
			_on_reply_pressed.bind(str(reply_text))
		)
		reply_list.add_child(reply_button)
func _on_reply_pressed(reply_text: String) -> void:
	player_replies.append({
		"text":reply_text
	})
	update_chat()
	
func advance_time(new_day:int, new_hour: int)->void:
	current_day = new_day
	current_hour = new_hour
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
