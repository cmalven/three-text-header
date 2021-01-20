uniform sampler2D imageTexture;
uniform float iter;
uniform vec2 currentMouse;
varying vec2 vUv;
varying vec3 vPosition;

// From THREE…
// uniform vec3 cameraPosition;

void main() {
  float u = vUv.x;
  float v = vUv.y;
  vec2 newUv = vec2(u, v);

  float dist = distance(vPosition.x - v*0.5, currentMouse.x);
  float distPct = 15.0 / dist;
  float distColorShift = distPct;

  float r = 1.0 - vPosition.z * 0.02 - distColorShift;
  float g = 1.0 - distColorShift;
  float b = 1.0 - vPosition.z * 0.02;

  vec3 texture = vec3(r, g, b);

  gl_FragColor = vec4(texture, vPosition.z * 0.031 + 1.2);
}