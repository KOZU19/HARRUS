extends TextEdit
@export var max_lines := 5
@export var max_characters := 300

func _ready() -> void:
	scroll_horizontal = false
	scroll_vertical = false
	text_changed.connect(_on_text_changed)

func _on_text_changed():
	var current_text := text
	if current_text.length() > max_characters:
		current_text = current_text.substr(0, max_characters)
	var lines := current_text.split("/n")
	if lines.size()> max_lines:
		lines = lines.slice(0, max_lines)
		current_text = "/n".join(lines)
	if current_text != text:
		text = current_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
