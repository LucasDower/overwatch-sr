String subfolder = "data";
String subfolderPath;

Series tank = new Series("Tank");
Series damage = new Series("Damage");
Series support = new Series("Support");

void setup() {
  fullScreen(1);

  textSize(14);
  background(#282C33);
  noLoop();
  strokeJoin(ROUND);
  strokeCap(ROUND);

  subfolderPath = sketchPath() + "\\" + subfolder;

  // Check data folder exists.
  File a = new File(subfolderPath);
  if (!a.exists() && !a.isDirectory()) {
    logToFile(subfolder + "/ does not exist.");
    exit();
  }

  Graph g = new Graph();
  parseFile("sr.txt", g, #E1C082);

  tank.setColour(#E1C082);
  damage.setColour(#67AEE7);
  support.setColour(#C27CD7);

  g.addSeries(tank);
  g.addSeries(damage);
  g.addSeries(support);

  /*
  tank.printPoints();
  damage.printPoints();
  support.printPoints();
  */

  g.drawGraph();

  save("output.jpg");
}

String subpath = "";

String parseLabel(String label) {
  String pattern = "<[A-Za-z 0-9]*>";
    if (!label.matches(pattern)) {
    logToFile(subpath + " is incorrectly formatted.");
    exit();
  }
  return label.replaceAll("<|>", "");
}

void parseFile(String filename, Graph g, color c) {
  // Check the file exists in the data subfolder.
  String path = subfolderPath + "\\" + filename;
  subpath = subfolder + "/" + filename;
  File a = new File(path);
  if (!a.exists() || a.isDirectory()) {
    logToFile(subpath + " does not exist.");
    exit();
  }
  String[] lines = loadStrings(path);

  // Check the file is useful.
  if (lines.length <= 1) {
    logToFile(subpath + " is too short and/or incorrectly formatted.");
    exit();
  }

  // The first line denotes the line's label.
  String label = parseLabel(lines[0]);

  Series s = new Series(label);
  s.setColour(c);

  int k = 0;

  for (int i = 1; i < lines.length; i++) {
    String[] line = lines[i].split(":");
    Series toAddto = new Series("void");

    switch (line[0]) {
      case "T":
        toAddto = tank;
        break;
      case "D":
        toAddto = damage;
        break;
      case "S":
        toAddto = support;
        break;
      default:
        logToFile(subpath + " is incorrectly formatted.");
        exit();
    }

    int SR = 0;
    try {
      SR = Integer.parseInt(line[1]);
    } catch (Exception ex) {
      logToFile(subpath + " is incorrectly formatted.");
      exit();
    }
    Point p = new Point(i-1, SR);
    k += toAddto.addPoint(p);
  }

  g.addSeries(s);

}

void logToFile(String errorMessage) {
  String[] m = {errorMessage};
  saveStrings("crash.log", m);
}
