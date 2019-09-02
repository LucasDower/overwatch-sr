int srGraph_marginTop = 50;
int srGraph_marginBottom = 250;
int srGraph_axisFactor = 25;

void srGraph_drawRole(int[] role, color colour, String roleText) {
  int l = role.length;

  float x = 0, y = 0;

  noFill();
  stroke(colour, lineAlpha);
  strokeWeight(lineWidth);

  // Draw the line segments;
  beginShape();
  for (int i = 0; i < l; i++) {
    x = i * h_size;
    y = map(role[i], minSR, maxSR, height-srGraph_marginBottom, srGraph_marginTop);
    vertex(x, y);
  }
  endShape();

  // Offset the text so it's not obscured by the line
  int offset = 25;
  if (l >= 2 && role[l-1] < role[l-2]) {
      offset = -15;
  }

  fill(colour, lineAlpha);
  textAlign(CENTER, CENTER);
  text(roleText, x, y - offset);

  dottedLine(x, y, h_size * (maxLength-1), y);
}

void srGraph_drawAxis() {
  axisConfig();

  line(0, height-srGraph_marginBottom, 0, srGraph_marginTop); // Vertical

  int axisMin = factorRound(minSR, srGraph_axisFactor);
  int axisMax = factorRound(maxSR, srGraph_axisFactor);
  minSR = min(axisMin, minSR);
  maxSR = max(axisMax, maxSR);
  for (int a = axisMin; a <= axisMax; a += srGraph_axisFactor) {
    float y = map(a, minSR, maxSR, height-srGraph_marginBottom, srGraph_marginTop);
    stroke(grid_line);
    if (a % 500 == 0) {
      stroke(grid_line_factor);
    }
    line(0, y, h_size * (maxLength-1), y);
    stroke(misc);
    text(a, -10, y);
    line(0, y, -5, y);
  }
  noFill();
}
