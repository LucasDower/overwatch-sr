class Graph {

  private ArrayList<Series> series;
  private int tickFactor = 50;
  private int marginBottom = 50;
  private int marginTop = 50;
  private int marginLeft = 50;
  private int marginRight = 50;

  private String label;

  private int axisTextPadding = 50;
  private int lineWeight = 4;
  private int axisWeight = 2;
  private int tickSize = 5;

  private int seriesMinX = Integer.MAX_VALUE;
  private int seriesMinY = Integer.MAX_VALUE;
  private int seriesMaxX = Integer.MIN_VALUE;
  private int seriesMaxY = Integer.MIN_VALUE;

  private int axisMin = Integer.MAX_VALUE;
  private int axisMax = Integer.MIN_VALUE;

  private color colour_grid_line = #2D313B;
  private color colour_grid_line_factor = #3B4047;
  private color colour_misc = #ACB2BE;

  public Graph() {
    series = new ArrayList<Series>();
  }

  public void setTickFactor(int tickFactor) {
    this.tickFactor = tickFactor;
  }

  private void addSeries(Series s) {
    seriesMinX = min(seriesMinX, s.getMinX());
    seriesMaxX = max(seriesMaxX, s.getMaxX());
    seriesMinY = min(seriesMinY, s.getMinY());
    seriesMaxY = max(seriesMaxY, s.getMaxY());
    series.add(s);
  }

  private void drawAxis() {
    int tX = width - marginRight;
    int tY = height - marginBottom;
    int seriesMin = Integer.MAX_VALUE;
    int seriesMax = Integer.MIN_VALUE;
    for (int i = 0; i < series.size(); i++) {
      Series tSeries = series.get(i);
      seriesMin = min(seriesMin, tSeries.getMinY());
      seriesMax = max(seriesMax, tSeries.getMaxY());
    }
    axisMin = factorRound(seriesMin);
    axisMax = factorRound(seriesMax) + tickFactor;
    seriesMin = min(axisMin, seriesMin);
    seriesMax = max(axisMax, seriesMax);
    //System.out.println(seriesMin + ", " + seriesMax);
    textAlign(RIGHT, CENTER);
    strokeWeight(axisWeight);
    // Ticks
    for (int a = axisMin; a <= axisMax; a += tickFactor) {
      float y = map(a, seriesMin, seriesMax, tY, marginTop);
      stroke(colour_grid_line);
      if (a % 500 == 0) {
        stroke(colour_grid_line_factor);
      }
      int bPoint = marginLeft + axisTextPadding - tickSize;
      line(bPoint, y, tX, y);
      fill(colour_misc);
      text(a, bPoint - 5, y);
      stroke(colour_misc);
      line(bPoint, y, marginLeft + axisTextPadding, y);
    }
    stroke(colour_misc);
    line(marginLeft + axisTextPadding, marginTop, marginLeft + axisTextPadding, tY);
  }

  private void drawSeries() {
    for (int i = 0; i < series.size(); i++) {
      Series tSeries = series.get(i);
      stroke(tSeries.getColour());
      float tempX = 0, tempY = 0;
      for (int j = 0; j < tSeries.getSize(); j++) {
        Point tPoint = tSeries.getPoint(j);
        tempX = map(tPoint.getX(), seriesMinX, seriesMaxX, marginLeft + axisTextPadding, width-marginRight);
        tempY = map(tPoint.getY(), axisMin, axisMax, height-marginBottom, marginTop);
        vertex(tempX, tempY);
        strokeWeight(2*lineWeight);
        point(tempX, tempY);
      }
      strokeWeight(lineWeight);
    }
  }

  private drawLabels() {
    for (int i = 0; i < series.size(); i++) {
      Series tSeries = series.get(i);
      textAlign(CENTER, CENTER);
      fill(tSeries.getColour());
      int l = tSeries.getSize();
      if ( tSeries.getPoint(l-2).getY() > tSeries.getPoint(l-1).getY()) {
        text(tSeries.getLabel(), tempX, tempY + 20);
      } else {
        text(tSeries.getLabel(), tempX, tempY - 20);
      }
      */
  }

  private int factorRound(int value) {
    return (((int) value/tickFactor)) * tickFactor;
  }

  public void drawGraph() {
    drawAxis();
    drawSeries();
    //drawLabels();
  }

}
