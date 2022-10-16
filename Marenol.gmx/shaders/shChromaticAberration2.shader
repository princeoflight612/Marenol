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

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Static
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float intensity;

float rand(vec2 co){
    return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    float noise = intensity*(rand(vec2(v_vTexcoord.y,time))-0.5);
    vec3 shift = 0.33*vec3(-intensity,0.0,intensity)+vec3(noise,noise,noise);
    vec4 textureR = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+vec2(shift.r,0.0))*vec4(1.0,0.0,0.2,1.0);
    vec4 textureG = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+vec2(shift.g,0.0))*vec4(0.2,1.0,0.0,1.0);
    vec4 textureB = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord+vec2(shift.b,0.0))*vec4(0.0,0.2,1.0,1.0);
    
    gl_FragColor = v_vColour * (textureR+textureG+textureB);
}

