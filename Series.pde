class Series {

  private ArrayList<Point> points;
  private color lineColour = #000000;

  private String label;

  private int minY = Integer.MAX_VALUE;
  private int maxY = Integer.MIN_VALUE;

  private int minX = Integer.MAX_VALUE;
  private int maxX = Integer.MIN_VALUE;

  public Series(String label) {
    this.label = label;
    points = new ArrayList<Point>();
  }

  public void printPoints() {
    System.out.println(label);
    for (int i = 0; i < points.size(); i++) {
      System.out.println(points.get(i).toString());
    }
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

  private int startingSR = -1;

  private void updateMinMax(Point p) {
    int tX = p.getX();
    minX = min(minX, tX);
    maxX = max(maxX, tX);
    int tY = p.getY();
    minY = min(minY, tY);
    maxY = max(maxY, tY);
  }

  public int addPoint(Point newPoint) {
    if (startingSR == -1) {
      startingSR = newPoint.getY();
      return 0;
    }
    updateMinMax(newPoint);


    if (points.size() > 0) {
      Point prevPoint = points.get(points.size() - 1);
      if (newPoint.getX() - prevPoint.getX() != 1) {
        Point intermediatePoint = new Point(newPoint.getX(), prevPoint.getY());
        updateMinMax(intermediatePoint);
        points.add(intermediatePoint);
        newPoint = new Point(newPoint.getX() + 1, newPoint.getY());
        points.add(newPoint);
        return 1;
      }
    } else {
      Point intermediatePoint = new Point(newPoint.getX(), startingSR);
      updateMinMax(intermediatePoint);
      points.add(intermediatePoint);
      newPoint = new Point(newPoint.getX() + 1, newPoint.getY());
      points.add(newPoint);
      return 1;
    }

    points.add(newPoint);
    return 0;
    /*
    if (points.size() > 0) {
      // There already exists a point, called 'prevPoint'.
      Point prevPoint = points.get(points.size() - 1);

      if (p.getX() - prevPoint.getX() == 1) {
        // If 'p' is adjacent to 'prevPoint',
        // add the new point. Return an offset of 0.
        points.add(p);
        return 0;
      } else {
        // Otherwise, copy the y-value of 'prevPoint' and place instead.
        // Add 'p' adjacent to the intermediate point 'q'.
        // Return an offset of 1.
        Point q = new Point(p.getX(), prevPoint.getY());
        points.add(q);
        Point pNew = new Point(p.getX() + 1, p.getY());

        tX = pNew.getX();
        minX = min(minX, tX);
        maxX = max(maxX, tX);
        tY = pNew.getY();
        minY = min(minY, tY);
        maxY = max(maxY, tY);

        points.add(p);
        return 1;
      }
    } else {
      // 'p' is the first point to be added.
      // Add it and return a offset of 0.
      points.add(p);
      return 0;
    }
    */

  }

}
