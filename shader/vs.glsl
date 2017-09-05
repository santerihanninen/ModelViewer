precision mediump float;

uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uNormalMatrix;

attribute vec3 aPosition;
attribute vec3 aNormal;
attribute vec4 aColor;
attribute vec2 aTextureCoordinates;

varying vec4 vPosition;
varying vec3 vNormal;
varying vec3 vTangent;
varying vec2 vTextureCoordinates;
varying vec4 vColor;

void main() {
  vPosition = uModelViewMatrix * vec4(aPosition, 1.0);
  vNormal = normalize(uNormalMatrix * aNormal);
  vTangent = vec3(1.0, 0.0, 0.0) - aNormal.x * aNormal;
  vTextureCoordinates = aTextureCoordinates;
  vColor = aColor;

  gl_Position = uProjectionMatrix * vPosition;
}
