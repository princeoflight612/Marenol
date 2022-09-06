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
// Liquid blob shader
//
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D t_DistortionMap;
uniform float amount;
void main()
{
    float offset=0.01;
    vec2 grad;
    grad.x = 0.001+texture2D(t_DistortionMap,v_vTexcoord+vec2(offset,0.0)).a-texture2D(gm_BaseTexture,v_vTexcoord-vec2(offset,0.0)).a;
    grad.y = 0.001+texture2D(t_DistortionMap,v_vTexcoord+vec2(0.0,offset)).a-texture2D(gm_BaseTexture,v_vTexcoord-vec2(0.0,offset)).a;
    
    //vec4 baseColour = v_vColour * texture2D( t_DistortionMap, v_vTexcoord );
    //vec4 texColour = v_vColour * texture2D( t_Material, vec2(0.5,0.5) - 0.5*(1.0-baseColour.a) * normalize(grad) );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture,v_vTexcoord+amount*normalize(grad));
    //gl_FragColor = v_vColour * texture2D( t_Material,v_vTexcoord );
}

