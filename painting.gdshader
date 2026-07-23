shader_type canvas_item;

uniform sampler2D mask;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	float a = texture(mask, UV).a;
	COLOR.a = 1.0 - a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
