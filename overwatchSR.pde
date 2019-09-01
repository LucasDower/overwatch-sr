
void setup() {
  fullScreen(2);
  
  PFont font = createFont("font.ttf", 32, true);
  textFont(font);
  
  tank = loadRoleFile("tank.txt");
  damage = loadRoleFile("damage.txt");
  support = loadRoleFile("support.txt");
  
  minSR = min(min(tank), min(damage), min(support));
  maxSR = max(max(tank), max(damage), max(support));
  maxLength = max(tank.length, damage.length, support.length);
  
  h_size = (width-h_margins) / maxLength;
  
  noLoop();
  noFill();  
}

int[] loadRoleFile(String filename) {
  String[] lines = loadStrings(filename);
  int[] sr = new int[lines.length];
  for (int i = 0; i < lines.length; i++) {
    sr[i] = Integer.parseInt(lines[i]);
  }
  return sr;
}



void drawStats() {
  fill(misc);
  int x = width-150;
  textAlign(RIGHT);
  Details tank_ = new Details(tank);
  tank_.drawMe("Tank",x, 100);
  Details damage_ = new Details(damage);
  damage_.drawMe("Damage", x, 140);
  Details support_ = new Details(support);
  support_.drawMe("Support", x, 180);
}

void drawAxis() {
  fill(misc);
  stroke(misc);
  textSize(20);
  strokeWeight(axisWidth);
  line(0, height-v_margins, 0, v_margins); // Vertical
  textAlign(RIGHT, CENTER);
  int axisMin = factorRound(minSR);
  minSR = min(axisMin, minSR);
  int axisMax = factorRound(maxSR);
  maxSR = max(axisMax, maxSR);
  for (int a = axisMin; a <= axisMax; a += axisFactor) {
    float y = map(a, minSR, maxSR, height-v_margins, v_margins);
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

void drawRole(int[] role, color c, String roleText) {
  stroke(c);
  beginShape();
  strokeJoin(ROUND);
  strokeCap(ROUND);
  Details details = new Details(role);
  float x = 0;
  float y = 0;
  int l = role.length;
  
  float tx = 0;
  float ty = map(role[0], minSR, maxSR, height-v_margins, v_margins);;
  for (int i = 2; i < l; i++) {
    x = i * h_size;
    y = map(role[i], minSR, maxSR, height-v_margins, v_margins);
    //vertex(x, y);
    strokeWeight(lineWidth);
    if (details.diffs[i-1] > 0) {
      float lW = map(details.diffs[i-1], 0, details.maxIncrease, 1, pointWidth);
      strokeWeight(lW);
    }
    if (details.diffs[i-1] < 0) {
      float lW = map(details.diffs[i-1], 0, details.maxDecrease, 1, pointWidth);
      strokeWeight(lW);
    }
    line(tx, ty, x, y);
    tx = x;
    ty = y;
    strokeWeight(pointWidth);
    //point(x, y);
  }
  int offset = 25;
  if (l >= 2 && role[l-1] < role[l-2]) {
      offset = -15;
  }
  strokeWeight(lineWidth);
  endShape();
  fill(c);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(roleText, x, y - offset);
  noFill();
  dottedLine(x, y, h_size * (maxLength-1), y);
}



void draw() { 
  translate((h_size+h_margins+50) / 2, 0);
  background(background);
  
  drawAxis();
  drawRole(tank, tank_colour, "Tank");
  drawRole(damage, damage_colour, "Damage");
  drawRole(support, support_colour, "Support");
  //drawStats();
  save("output.png");
}
