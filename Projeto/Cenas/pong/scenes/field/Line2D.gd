extends Line2D

# Declare member variables here. Examples:
export var dash_length = 10
export (Color) var line_color
export var space_length = 10
export (Color) var space_color

func _draw():
	draw_dashed_line(points[0], points[1], true)

func draw_dashed_line(from, to, antialiased = false):
	var length = (to - from).length()
	var normal = (to - from).normalized()
	var dash_step = normal * dash_length
	var space_step = normal * space_length
	
	if length < dash_length:
		draw_line(from, to, line_color, width, antialiased)
		return
	else:
		var draw_dash = true
		var segment_start = from
		var segment_end = segment_start
		
		var reached_end = true
		while reached_end:
			if draw_dash:
				if (segment_end - to).length() < dash_length:
					segment_end = to
					reached_end = false
				else:
					segment_end = segment_start + dash_step
				draw_line(segment_start, segment_end, line_color, width, antialiased)
			else:
				if (segment_end - to).length() < space_length:
					segment_end = to
					reached_end = false
				else:
					segment_end = segment_start + space_step
				draw_line(segment_start, segment_end, space_color, width, antialiased)

			segment_start = segment_end
			draw_dash = !draw_dash