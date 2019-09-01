int factorRound(int sr) {
  return (round(sr/(float) axisFactor)) * axisFactor;
}

void dottedLine(float x0, float y0, float x1, float y1) {
  float ticks = dist(x0, y0, x1, y1) / lineWidth;
  for (int i = 0; i < ticks; i+=2) {
    float x = map(i, 0, ticks-1, x0, x1);
    float y = map(i, 0, ticks-1, y0, y1);
    point(x, y);
  }
}
