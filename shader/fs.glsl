  precision mediump float;

  uniform bool uUseLighting;
  uniform bool uUseDiffuseTexture;
  uniform bool uUseNormalMap;

  uniform mat4 uModelViewMatrix;
  // uniform mat4 uProjectionMatrix;
  uniform mat3 uNormalMatrix;

  uniform sampler2D uDiffuseSampler;
  uniform sampler2D uNormalSampler;

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

  uniform vec4 uDiffuse;
  uniform vec3 uSpecular;
  uniform float uGlossiness;

  varying vec4 vPosition;
  varying vec3 vNormal;
  varying vec3 vTangent;
  varying vec2 vTextureCoordinates;
  varying vec4 vColor;


  void main() {

    vec4 diffuseColor;

    if (uUseDiffuseTexture) {
      diffuseColor = texture2D(uDiffuseSampler, vTextureCoordinates);
    } else {
      diffuseColor = uDiffuse * vColor;
    }

    // normal vector
    vec3 n;

    if (uUseNormalMap) {
      vec3 normalFromTexture = texture2D(uNormalSampler, vTextureCoordinates).xyz * 2.0 - 1.0;
      n = normalize(uNormalMatrix * normalFromTexture);
    } else {
      n = normalize(vNormal);
    }

    // to-viewer vector
    vec3 v = -normalize(vPosition.xyz);

    // to-light vector
    vec3 l = normalize(vec3(10.0, 3.0, 17.0)); //FIXME takes the light location from a constant

    // half-angle vector
    vec3 h = normalize(l + v);

    //vec3 ambient = vec3(0.1, 0.1, 0.1);
    vec3 diffuse = diffuseColor.rgb * max(dot(n, l), 0.0);
    vec3 specular = uDirectionalLightSpecularColor * pow(max(dot(h, n), 0.0), uGlossiness);

    vec3 lightIntensity = uDirectionalLightIntensity;

    gl_FragColor = vec4(lightIntensity * (diffuse + specular), 1);
  }
