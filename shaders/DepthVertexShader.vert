// Input vertex data, different for all executions of this shader.
layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec2 vertexUV;
layout(location = 2) in vec3 normal;
layout(location = 3) in uint textureIndex;

// Passthrough texture index and UVs
flat out uint texIndex;
out vec2 UV;

// Values that stay constant for the whole mesh.
uniform mat4 lightSpaceMatrix;
uniform mat4 transformationMatrix;

void main(){
 // Passthrough to fragment shader for alpha discard
 texIndex = textureIndex;
 UV = vertexUV;

 gl_Position = lightSpaceMatrix * transformationMatrix * vec4(vertexPosition_modelspace, 1.0);
}