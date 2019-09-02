int[] tank;
int[] damage;
int[] support;

int[] diffs_tank;
int[] diffs_damage;
int[] diffs_support;

float h_size;
int minSR, maxSR, maxLength;
int minDiff, maxDiff;

int lineAlpha = 255;

float v_margins = 50;
float h_margins = 125;

int lineWidth = 4;
int pointWidth = 8;
int axisWidth = 2;

color background = #282C33;
color grid_line = #2D313B;
color grid_line_factor = #3B4047;
color misc = #ACB2BE;

color tank_colour = #E1C082;
color damage_colour = #67AEE7;
color support_colour = #C27CD7;

void config() {
    PFont font = createFont("data/font.ttf", 32, true);
    textFont(font);
    textSize(20);

    noLoop();
    noFill();
    strokeJoin(ROUND);
    strokeCap(ROUND);
}
