int diffGraph_marginTop = 880;
int diffGraph_marginBottom = 50;
int diffGraph_axisFactor = 15;

void diffGraph_drawAxis() {
  axisConfig();

  line(0, height-diffGraph_marginBottom, 0, diffGraph_marginTop); // Vertical

  int axisMin = factorRound(minDiff, diffGraph_axisFactor);
  int axisMax = factorRound(maxDiff, diffGraph_axisFactor);
  minDiff = min(axisMin, minDiff);
  maxDiff = max(axisMax, maxDiff);

  for (int a = axisMin; a <= axisMax; a += diffGraph_axisFactor) {
    float y = map(a, minDiff, maxDiff, height-diffGraph_marginBottom, diffGraph_marginTop);
    
    stroke(grid_line);
    if (a == 0) {
      stroke(grid_line_factor);
    }


    line(0, y, h_size * (maxLength-1), y);
    stroke(misc);
    //text(a, -10, y);
    text("uninstall", -10, height-diffGraph_marginBottom);
    text("carrying", -10, diffGraph_marginTop);
    line(0, y, -5, y);
  }
  noFill();
}


void diffGraph_drawRole(int[] diffs, color colour) {
  stroke(colour, lineAlpha);
  strokeWeight(lineWidth);
  noFill();
  beginShape();
  for (int i = 0; i < diffs.length; i++) {
    float x = map(i, 0, maxLength-1, 0, width-h_margins);
    float y = map(diffs[i], minDiff, maxDiff, height-diffGraph_marginBottom, diffGraph_marginTop);
    vertex(x, y);
  }
  endShape();
}
