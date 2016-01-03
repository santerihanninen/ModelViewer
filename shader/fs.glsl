  precision mediump float;

  // control
  // uniform bool uUseLighting;
  // uniform bool uUseDiffuseTexture;
  // uniform bool uUseNormalMap;

  // interpolated inputs from vertex shader
  varying vec4 vPosition;
  varying vec3 vTransformedNormal;
  // varying vec2 vTextureCoord;
  // varying vec4 vColor;

  // material parameters
  uniform vec4 uDiffuseColor;
  uniform float uGlossiness;
  // uniform bool isPlane;

  // lighting information IN WHAT SPACE???
  // uniform vec3 uAmbientLighting;
  // uniform int uNumberOfDirectionalLights;
  // uniform int uNumberOfPointLights;
  uniform vec3 uDirectionalLightIntensity;
  uniform vec3 uDirectionalLightDirection;
  uniform vec3 uDirectionalLightSpecularColor;
  // uniform vec3 uPointLightLocation;
  // uniform vec3 uPointLightDiffuse;
  // uniform vec3 uPointLightSpecular;
  // uniform vec3 uMaterialAmbient;

  varying mat4 vModelViewMatrix;

  // uniform sampler2D uSampler;

  void main() {
    // normal vector
    vec3 n = normalize(vTransformedNormal);
    // to-viewer vector
    vec3 v = vec3(0.0, 0.0, 0.0) - vPosition.rgb;
    v = vec3(vModelViewMatrix[3][0], vModelViewMatrix[3][1], vModelViewMatrix[3][2]);
    // half-angle vector
    vec3 h = normalize(normalize(v) + normalize(-uDirectionalLightDirection));

    //vec3 ambient = vec3(0.1, 0.1, 0.1);

    vec3 diffuse = uDiffuseColor.rgb * max(0.0, dot(n, normalize(-uDirectionalLightDirection)));
    // vec3 specular = dot(uSpecularColor, pow(max(0.0, dot(h, n)), uGlossiness));
    vec3 specular = uDirectionalLightSpecularColor * pow(max(dot(h, n), 0.0), uGlossiness);

    gl_FragColor = vec4(uDirectionalLightIntensity * (diffuse + specular), 1);
  }
