int factorRound(int sr, int factor) {
  return (round(sr/(float) factor)) * factor;
}

void dottedLine(float x0, float y0, float x1, float y1) {
  float ticks = dist(x0, y0, x1, y1) / lineWidth;
  for (int i = 2; i < ticks; i+=2) {
    float x = map(i, 0, ticks-1, x0, x1);
    float y = map(i, 0, ticks-1, y0, y1);
    point(x, y);
  }
}

void strokeFill(color s, color f) {
  stroke(s);
  fill(f);
}

void strokeFill(color s) {
  stroke(s);
  noFill();
}

void widthLine(float x1, float y1, float x2, float y2, float initalWidth, float finalWidth) {
  int steps = 50;
  for (int i = 0; i < steps; i++) {
    float tx = map(i, 0, steps-1, x1, x2);
    float ty = map(i, 0, steps-1, y1, y2);
    float tw = map(i, 0, steps-1, initalWidth, finalWidth);
    strokeWeight(tw);
    point(tx, ty);
  }
}

void axisConfig() {
  stroke(misc);
  strokeWeight(axisWidth);
  fill(misc);
  textAlign(RIGHT, CENTER);
}
