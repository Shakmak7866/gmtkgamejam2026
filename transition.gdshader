shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform bool reverse = false;
uniform float tile_size = 32.0; // The target size of each square in pixels
uniform float aspect_ratio = 1.7778; // Width / Height (e.g., 16/9)

float rand(vec2 co) {
	return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
	// Dynamically calculate grid columns and rows based on aspect ratio
	vec2 num_of_tiles = vec2(tile_size * aspect_ratio, tile_size);
	
	// Snap UV coordinates to the square pixelated grid
	vec2 grid_pos = floor(UV * num_of_tiles);
	
	float random_offset = rand(grid_pos) * 0.2;
	float tile_y = grid_pos.y / num_of_tiles.y;
	float threshold = tile_y + random_offset;
	
	if (threshold > progress * 1.2) {
		if (!reverse) discard;
	} else {
		if (reverse) discard;
	}
}
