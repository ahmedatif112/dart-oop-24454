# Dart OOP Assignment: Kigali Bus Card

**Name:** Ahmed Atif Abdalla
**Student ID:** 24454

## My numbers

- D = 54, L = 4
- Starting balance = 1000 + (54 × 10) = 1540 RWF
- Bus fare = 200 + 54 = 254 RWF
- Student discount = 10 + 4 = 14%

## Output of main.dart

```
Error: name too short
Owner: Ahmed | Balance: 1540 RWF
Owner: Ahmed Atif Abdalla | Balance: 1540 RWF
Error: top-up must be 500 to 50000 RWF
Topped up 2000 RWF
Paid 254 RWF
Paid 254 RWF
Owner: Ahmed Atif Abdalla | Balance: 3032 RWF
Student discount: 35 RWF
Paid 219 RWF
Owner: Ahmed Atif Abdalla | Balance: 1321 RWF
Student card: 14% off
```

## Part 1: Why no setter for balance?

If there were a setter for balance, anyone could write card.balance = 1000000 and skip all the rules. Without a setter, the balance can only change through topUp (which checks the amount is 500 to 50000 RWF) and pay (which checks there is enough money). This keeps the money on the card safe.

## Part 2: What does ~/ do?

The / operator gives the full decimal answer, and ~/ gives only the whole number and drops the decimals.

- print(237 * 17 / 100); prints 40.29
- print(237 * 17 ~/ 100); prints 40

In StudentCard, fare * _discount ~/ 100 gives the discount as a whole number of RWF.

## Part 4: Bug table

| Bug | The line | Why it is wrong (your words) | Your fix |
|---|---|---|---|
| 1 | `String _brand;` and `int _battery;` | The fields have no starting value, and Dart does not allow String and int to be empty (null). | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | The child constructor does not build the parent Phone, and Phone needs a brand and a battery. | Add `: super(brand, battery)` after the parameters. |
| 3 | `@override` above `void restart()` | @override only works when the parent class has the same method, and Phone has no restart method. | Remove `@override`. |
| 4 | `p.battery = 100;` | Phone has a getter for battery but no setter, so the value cannot be changed. | Add `set battery(int value)` that accepts only 0 to 100. |
| 5 | `print(p.battery());` | battery is a getter, not a method, so it must not have (). | Write `print(p.battery);` |
| Not a bug | `Phone p = new Phone('Tecno', 50);` | The word new is old style, but Dart still allows it and it works. | (none) |

## Part 5

My prediction:

```
1
5
```

Why: For Bag a, add() makes _items 1. Then a.items = -5 is refused, because the setter only accepts values of 0 or more, so it stays 1 and prints 1. For BigBag b, its add() calls super.add() two times, so each add() adds 2. After two calls _items is 4. Then b.items = b.items + 1 makes it 5, which is allowed, so it prints 5.

Real output:

```
1
5
```

Was I right? Yes, my prediction matched the real output.