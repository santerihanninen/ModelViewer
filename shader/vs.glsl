attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec2 aTextureCoordinates;
attribute vec4 aColor;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

varying vec4 vPosition;
varying vec3 vTransformedNormal;
varying vec2 vTextureCoordinates;
varying vec4 vColor;
varying mat4 vModelViewMatrix;

void main() {
  vPosition = uModelViewMatrix * vec4(aPosition, 1.0);
  gl_Position = uProjectionMatrix * vPosition;

  vTransformedNormal = normalize(uNormalMatrix * aNormal);

  vTextureCoordinates = aTextureCoordinates;

  vColor = aColor;
}
