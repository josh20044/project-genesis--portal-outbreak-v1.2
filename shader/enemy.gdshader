shader_type canvas_item;
uniform vec4 blink_color: source_color;
uniform float blink_intensity = 0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color = mix(color, blink_color, blink_intensity * color.a);

	COLOR = color;
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
