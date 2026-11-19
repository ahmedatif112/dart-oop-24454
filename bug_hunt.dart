class Phone {
  // Bug 1 fix: fields now have starting values
  String _brand = '';
  int _battery = 0;

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // Bug 4 fix: setter that accepts only 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2 fix: super builds the parent Phone first
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // Bug 3 fix: @override removed, because Phone has no restart method
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  // Not a bug: "new" is old style, but Dart still allows it
  Phone p = new Phone('Tecno', 50);
  p.battery = 100;
  // Bug 5 fix: battery is a getter, so no () is used
  print(p.battery);
}