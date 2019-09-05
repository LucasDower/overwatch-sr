void setup() {
  fullScreen(2);
  
  textSize(14);
  background(#282C33);
  noLoop();
  strokeJoin(ROUND);
  strokeCap(ROUND);
  
  Series tank = new Series();
  Series damage = new Series();
  Series support = new Series();
  
  tank.loadFromFile("data/tank.txt", 0);
  damage.loadFromFile("data/damage.txt", 0);
  support.loadFromFile("data/support.txt", 0);

  tank.setColour(#E1C082);
  damage.setColour(#67AEE7);
  support.setColour(#C27CD7);
  
  Graph g = new Graph();
  g.addSeries(tank);
  g.addSeries(damage);
  g.addSeries(support);
  g.drawGraph();
  
  save("output.png");
}
