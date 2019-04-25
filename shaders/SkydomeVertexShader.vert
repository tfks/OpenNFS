/*http://blog.simonrodriguez.fr/articles/28-06-2015_un_ciel_dans_le_shader.html*/
//---------IN------------
layout(location = 0)in vec3 vertexPosition_modelspace;
layout(location = 1) in vec2 vertexUV;
layout(location = 2) in vec3 normal;
//---------UNIFORM------------
uniform vec3 sunPosition;//sun position in world space
uniform mat4 projectionMatrix, viewMatrix, transformationMatrix;
uniform mat3 starRotationMatrix;//rotation matrix for the stars
//---------OUT------------
out vec3 pos;
out vec3 sun_norm;
out vec3 star_pos;

//---------MAIN------------
void main(){
    vec4 worldPosition = transformationMatrix * vec4(vertexPosition_modelspace, 1.0);
    gl_Position =  projectionMatrix * viewMatrix * worldPosition;

    pos = vertexPosition_modelspace;

    //Sun pos being a constant vector, we can normalize it in the vshader
    //and pass it to the fshader without having to re-normalize it
    sun_norm = normalize(sunPosition);

    //And we compute an approximate star position using the special rotation matrix
    star_pos = starRotationMatrix * normalize(pos);
}