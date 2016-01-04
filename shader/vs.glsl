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

void main() {
  vPosition = uModelViewMatrix * vec4(aPosition, 1.0);

  vTransformedNormal = normalize(uNormalMatrix * aNormal);

  vTextureCoordinates = aTextureCoordinates;

  vColor = aColor;

  gl_Position = uProjectionMatrix * vPosition;
}
