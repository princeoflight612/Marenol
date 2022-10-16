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
const float PI=3.1415;
int numLayers=2;
void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

float alpha=0.0;
for(int i=1;i<=numLayers;i++){
float factor=float(i);
    float time1=time*100.0;
    
    alpha+=(0.6+0.5*(0.5+0.4*sin(factor*(0.04*time1+2.1*v_vTexcoord[0])))*sin(2.0*PI*factor*(0.009*time1+sin(0.01*time1)*v_vTexcoord[0]+0.6*v_vTexcoord[1]))+0.5*(0.5+0.4*cos(factor*0.02*time1))*cos(1.5*PI*factor*(-0.016*time1+0.3*v_vTexcoord[0]+1.3*v_vTexcoord[1])))/(factor+0.5);
}
gl_FragColor = v_vColour * vec4(1.0,0.0,0.0,0.6*alpha);
}


