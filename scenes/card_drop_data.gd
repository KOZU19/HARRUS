# in a card's _drop_data



func _drop_data(_pos, data):
	var from = data              # the dragged card
	var parent = get_parent()
	var my_idx = get_index()
	parent.move_child(from, my_idx)   # shifts the others automatically
