//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// fragment shader
// sepia shader
// https://www.shadertoy.com/view/XllSzM

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float intensity; //0.75 by default
uniform float time;

void main() {
    vec3 sepia = vec3(1.2, 1.0, 0.8);
    
    vec4 sample = texture2D(gm_BaseTexture, v_vTexcoord);
    
    float grey = dot(sample.rgb, vec3(0.299, 0.587, 0.114));
    vec3 sepiaColour = vec3(grey) * sepia;
    gl_FragColor = vec4(mix(sample.rgb, vec3(sepiaColour), intensity), sample.a);
}

