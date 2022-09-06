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
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform float intensity;
void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = v_vTexcoord;
    
    // Time varying pixel color
    vec3 col = 0.5 + 0.5*cos(time+uv.xyx+vec3(0,2,4));

    //float value = (1.0+cos(0.6*time-3.55*uv.x) + 2.0*cos(0.5+0.2*time-1.1*uv.x) + cos(0.33+1.5*time-6.0*uv.x))/2.0;
    float stretch = cos(11.0*uv.x-time)+0.1*cos(22.0*uv.x-2.0*time);
    float value = (4.5+0.5*cos(0.33+1.5*time-66.0-17.0*stretch*uv.x) + 2.0*cos(0.5-3.2*time-11.1*uv.x)+2.0*cos(0.33+1.5*time-8.0*uv.x))/9.0;
    float value2 = 0.8-sqrt(value*value + pow(uv.y-0.5-0.2*stretch,2.0));
    // Output to screen
    gl_FragColor = vec4(col*value2,1.0);
}

