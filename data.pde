void loadData() {
    tank = loadRoleFile("data/tank.txt");
    damage = loadRoleFile("data/damage.txt");
    support = loadRoleFile("data/support.txt");

    diffs_tank = calculateDiffs(tank);
    diffs_damage = calculateDiffs(damage);
    diffs_support = calculateDiffs(support);

    minSR = min(min(tank), min(damage), min(support));
    maxSR = max(max(tank), max(damage), max(support));
        
    maxLength = max(tank.length, damage.length, support.length);

    h_size = (width-h_margins) / maxLength;
}

int range = 10;

int[] calculateDiffs(int[] role) {
  int[] temp = new int[role.length - 1];
  int[] storage = new int[range];
  for (int i = 0; i < role.length - 1; i++) {
    int diff = role[i+1] - role[i];
    storage[i % range] = diff;
    int total = 0;
    for (int s : storage) {
      total += s; 
    }
    int a = total / range;
    minDiff = min(minDiff, a);
    maxDiff = max(maxDiff, a);
    temp[i] = a;
  }
  return temp;
}

int[] loadRoleFile(String filename) {
  String[] lines = loadStrings(filename);
  int[] sr = new int[lines.length];
  for (int i = 0; i < lines.length; i++) {
    sr[i] = Integer.parseInt(lines[i]);
  }
  return sr;
}
