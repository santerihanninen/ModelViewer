attribute vec3 aVertexPosition;
attribute vec3 aVertexNormal;
// attribute vec2 aTextureCoord;
attribute vec4 aVertexColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

varying vec4 vPosition;
varying vec3 vTransformedNormal;
// varying vec2 vTextureCoord
// varying vec4 vColor;
varying mat4 vModelViewMatrix;

void main() {
  vPosition = uModelViewMatrix * vec4(aVertexPosition, 1.0);
  vTransformedNormal = uNormalMatrix * aVertexNormal;
  gl_Position = uProjectionMatrix * vPosition;

  vModelViewMatrix = uModelViewMatrix;

  // vColor = aVertexColor;
  // vTransformedNormal = uNMatrix * aVertexNormal;
  // vTextureCoord = aTextureCoord;
}
