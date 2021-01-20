uniform float iter;
uniform vec2 currentMouse;
varying vec2 vUv;
varying vec3 vPosition;

// From THREE…
// uniform vec3 cameraPosition;
// attribute vec3 position;
// attribute vec2 uv;

float easeIn(float t) {
  return t * t;
}

float lerp(float start, float end, float pct) {
  return (start + (end - start) * pct);
}

void main() {
    float dist = distance(position.x, currentMouse.x);
    float distPct = dist / 5.0;

    vec3 adjustedPosition = vec3(
    position.x,
    position.y,
    position.z + sin(iter * 0.03 + uv.x*0.1) * distPct
    );

  vec4 mvPosition = modelViewMatrix * vec4(adjustedPosition, 1.0);

  vUv = uv;
  vPosition = adjustedPosition;

  gl_Position = projectionMatrix * mvPosition;
}