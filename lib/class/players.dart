class Players {
  String name;
  int buyin = 1;
  double base;
  double total = 0.0;
  double playerBase = 0.0;
  double earning = 0.0;
  List<int> denominationCount = [];
  bool directAmountMode = false;
  String savedAmountText = '';

  void increasebuyin() {
    buyin++;
  }

  void decreasebuyin(int mode) {
    if (buyin > 0) {
      buyin--;
    }
  }

  void updateValues() {
    playerBase = buyin * base;
    earning = total - playerBase;
    print("$name Total: $total, Earning: $earning, Base: $playerBase, Total: $total");
  }

  Players(this.name, this.base) {
    playerBase = buyin * base;
  }
}
