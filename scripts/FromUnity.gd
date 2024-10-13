class_name FromUnity

static func find_node_in_children(parent, type) -> Node:
	for node in parent.get_children():
		if is_instance_of(node, type):
			return node
	print("node was not found")
	return null
