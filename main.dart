class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor: sets the owner name and the starting balance
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter: lets other code read the owner
  String get owner {
    return _owner;
  }

  // Getter for balance. There is no setter, so the balance can only
  // change through topUp and pay.
  int get balance {
    return _balance;
  }

  // Setter: refuses names shorter than 3 characters
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // Prints the card information
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // Adds money to the card, only if the amount is from 500 to 50000 RWF
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // Pays a fare. If the fare is more than the balance, the card is declined.
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

// StudentCard inherits everything from BusCard but pays a discounted fare
class StudentCard extends BusCard {
  int _discount = 0;

  // super(owner, balance) builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // Prints the parent info first, then the discount
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // Works out the discount, then uses the parent's pay with the lower fare.
  // ~/ divides and keeps only the whole number.
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 54, L = 4
  // Starting balance = 1540 RWF, Bus fare = 254 RWF, Discount = 14%

  // Create a card and test the setter (the short name is refused)
  BusCard card = BusCard('Ahmed', 1540);
  card.owner = 'Al';
  card.showInfo();

  // Change the owner to my full name
  card.owner = 'Ahmed Atif Abdalla';
  card.showInfo();

  // Top up 100 RWF (refused), then 2000 RWF (accepted)
  card.topUp(100);
  card.topUp(2000);

  // Pay the bus fare two times
  card.pay(254);
  card.pay(254);
  card.showInfo();

  // Create a student card and pay the fare with the discount
  StudentCard student = StudentCard('Ahmed Atif Abdalla', 1540, 14);
  student.pay(254);
  student.showInfo();
}