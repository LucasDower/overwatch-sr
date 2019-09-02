void setup() {
  fullScreen(1);
  config();
  loadData();
}

int div = height/2;

void draw() {
  translate((h_size+h_margins+50) / 2, 0);
  background(background);

  srGraph_drawAxis();
  srGraph_drawRole(tank, tank_colour, "Tank");
  srGraph_drawRole(damage, damage_colour, "Damage");
  srGraph_drawRole(support, support_colour, "Support");

  diffGraph_drawAxis();
  diffGraph_drawRole(diffs_tank, tank_colour);
  diffGraph_drawRole(diffs_damage, damage_colour);
  diffGraph_drawRole(diffs_support, support_colour);
  
  save("output.png");
}
