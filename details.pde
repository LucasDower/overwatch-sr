class Details {
  public int[] diffs;
  public int avgIncrease;
  public int avgDecrease;
  public int avg;
  public int maxIncreaseIndex;
  public int maxDecreaseIndex;
  public int maxIncrease;
  public int maxDecrease;
  
  public Details(int[] sr) {
    float sum = sr[0];
    float inc = 0;
    float dec = 0;
    float a = 0;
    float b = 0;
    int maxInc = 0;
    int maxDec = 0;
    diffs = new int[sr.length];
    for (int i = 1; i < sr.length; i++) {
      sum += sr[i];
      float diff = sr[i] - sr[i-1];
      diffs[i] = (int) diff;
      if (diff > 0) {
        inc += diff;
        a++;
      }
      if (diff < 0) {
        dec += diff;
        b++;
      }
      if (diff < maxDec) {
        maxDec = (int) diff;
        maxDecreaseIndex = i;
        maxDecrease = (int) diff;
      }
      if (diff > maxInc) {
        maxInc = (int) diff;
        maxIncreaseIndex = i;
        maxIncrease = (int) diff;
      }
      maxDec = min(maxDec, (int) diff);
      maxInc = max(maxInc, (int) diff);
    }
    avgIncrease = (int)(inc/a);
    avgDecrease = (int)(dec/b);
    avg = (int)(sum / sr.length);
  }
  
  void drawMe(String r, int x, int y) {
    String addition = "";
    int tolerance = 2;
    int a = avgIncrease + avgDecrease;
    if (a > tolerance) {
      addition = "SR too low"; 
    } else if (a < -tolerance) {
      addition = "SR too high"; 
    } else {
      addition = "SR about right"; 
    }
    text(r + " - Ø: " + avg + ", Ø↑: " + avgIncrease + ", Ø↓: " + avgDecrease + ", " + addition, x, y);
  }
}
