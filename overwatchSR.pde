
void setup() {
  fullScreen(2);
  
  PFont font = createFont("data/font.ttf", 32, true);
  textFont(font);
  textSize(20);
  
  tank = loadRoleFile("data/tank.txt");
  damage = loadRoleFile("data/damage.txt");
  support = loadRoleFile("data/support.txt");
  
  minSR = min(min(tank), min(damage), min(support));
  maxSR = max(max(tank), max(damage), max(support));
  maxLength = max(tank.length, damage.length, support.length);
  
  h_size = (width-h_margins) / maxLength;
  
  noLoop();
  noFill();  
  strokeJoin(ROUND);
  strokeCap(ROUND);
}

int[] loadRoleFile(String filename) {
  String[] lines = loadStrings(filename);
  int[] sr = new int[lines.length];
  for (int i = 0; i < lines.length; i++) {
    sr[i] = Integer.parseInt(lines[i]);
  }
  return sr;
}

void drawAxis() {
  strokeFill(misc, misc);
  
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

void drawRole(int[] role, color colour, String roleText) {
  float x = 0, y = 0;
  int l = role.length;

  beginShape();
  strokeFill(colour);
  for (int i = 0; i < l; i++) {
    x = i * h_size;
    y = map(role[i], minSR, maxSR, height-v_margins, v_margins);
    vertex(x, y);
    strokeWeight(pointWidth);
    point(x, y);
  }
  strokeWeight(lineWidth);
  endShape();
  
  int offset = 25;
  if (l >= 2 && role[l-1] < role[l-2]) {
      offset = -15;
  }
  
  fill(colour);
  textAlign(CENTER, CENTER);
  text(roleText, x, y - offset);
  
  dottedLine(x, y, h_size * (maxLength-1), y);
}

void draw() { 
  translate((h_size+h_margins+50) / 2, 0);
  background(background);
  
  drawAxis();
  drawRole(tank, tank_colour, "Tank");
  drawRole(damage, damage_colour, "Damage");
  drawRole(support, support_colour, "Support");

  save("output.png");
}
