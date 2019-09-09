class Series {

  private ArrayList<Point> points;
  private ArrayList<Point> breaks;
  private color lineColour = #000000;
  
  private String label;

  private int minY = Integer.MAX_VALUE;
  private int maxY = Integer.MIN_VALUE;

  private int minX = Integer.MAX_VALUE;
  private int maxX = Integer.MIN_VALUE;

  public Series(String label) {
    this.label = label;
    points = new ArrayList<Point>();
    breaks = new ArrayList<Point>();
  }
  
  public String getLabel() {
    return label;
  }
  
  public void setColour(color c) {
    lineColour = c;
  }
  
  public color getColour() {
    return lineColour;
  }

  public int getSize() {
    return points.size();
  }

  public Point getPoint(int k) {
    return points.get(k);
  }

  public ArrayList<Point> getPoints() {
    return points;
  }

  public int getMinY() {
    return minY;
  }

  public int getMaxY() {
    return maxY;
  }

  public int getMinX() {
    return minX;
  }

  public int getMaxX() {
    return maxX;
  }

  public void addPoint(Point p) {
    int tX = p.getX();
    minX = min(minX, tX);
    maxX = max(maxX, tX);
    int tY = p.getY();
    minY = min(minY, tY);
    maxY = max(maxY, tY);
    points.add(p);
  }

}
