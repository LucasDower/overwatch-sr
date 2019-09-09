String subfolder = "data";
String subfolderPath;

void setup() {
  fullScreen(2);
  
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
  parseFile("tank.txt", g, #E1C082);
  parseFile("damage.txt", g, #67AEE7);
  parseFile("support.txt", g, #C27CD7);
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
  
  int numSeries = 1;
  
  for (int i = 1; i < lines.length; i++) {
    String line = lines[i];
    int value = 0;
    try {
      value = Integer.parseInt(line);
      Point p = new Point(i - numSeries, value);
      s.addPoint(p);
    } catch (Exception ex) {
      g.addSeries(s);
      label = parseLabel(line);
      s = new Series(label);
      s.setColour(c);
      numSeries++;
    }
  }
  g.addSeries(s);

}

void logToFile(String errorMessage) {
  String[] m = {errorMessage};
  saveStrings("crash.log", m);
}
