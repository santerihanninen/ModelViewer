  precision mediump float;

  // control
  // uniform bool uUseLighting;
  // uniform bool uUseDiffuseTexture;
  // uniform bool uUseNormalMap;

  varying vec4 vPosition;
  varying vec3 vTransformedNormal;
  varying vec2 vTextureCoordinates;
  varying vec4 vColor;

  uniform vec4 uDiffuse;
  uniform vec3 uSpecular;
  uniform float uGlossiness;

  // uniform sampler2D uDiffuseSampler;
  // uniform sampler2D uNormalSampler;

  // uniform int uNumberOfLights;

  // uniform vec3 uAmbientLighting;
  // uniform int uNumberOfDirectionalLights;
  // uniform int uNumberOfPointLights;
  uniform vec3 uDirectionalLightIntensity;
  uniform vec3 uDirectionalLightDirection;
  uniform vec3 uDirectionalLightSpecularColor;
  // uniform vec3 uPointLightLocation;
  // uniform vec3 uPointLightDiffuse;
  // uniform vec3 uPointLightSpecular;

  void main() {

    vec4 diffuseColor = uDiffuse * vColor;

    // normal vector
    vec3 n = normalize(vTransformedNormal);

    // to-viewer vector
    vec3 v = -normalize(vPosition.xyz);

    // to-light vector
    vec3 l = normalize(vec3(10.0, 3.0, 17.0));

    // half-angle vector
    vec3 h = normalize(l + v);

    //vec3 ambient = vec3(0.1, 0.1, 0.1);
    vec3 diffuse = diffuseColor.rgb * max(dot(n, l), 0.0);
    vec3 specular = uDirectionalLightSpecularColor * pow(max(dot(h, n), 0.0), uGlossiness);

    gl_FragColor = vec4(uDirectionalLightIntensity * (diffuse + specular), 1);
  }
