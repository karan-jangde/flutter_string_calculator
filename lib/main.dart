
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = "0";

  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  void _calculate() {
    String input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _result = "Please enter numbers separated by commas";
      });
      return;
    }
    try {
      double sum = _calculateDifference(input);
      setState(() {
        _result = sum.toString();
      });
    } catch (e) {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  double _calculateSum(String input) {
    List<String> numbers = input.split(',');
    double sum = 0;

    for (var number in numbers) {
      sum += double.parse(number.trim());
    }

    return sum;
  }

  double _calculateDifference(String input) {
    List<String> numbers = input.split(',');
    if (numbers.isEmpty) return 0;

    double difference = double.parse(numbers[0].trim());

    for (int i = 1; i < numbers.length; i++) {
      difference -= double.parse(numbers[i].trim());
    }

    return difference;
  }

  double _calculateProduct(String input) {
    List<String> numbers = input.split(',');
    double product = 1;

    for (var number in numbers) {
      product *= double.parse(number.trim());
    }

    return product;
  }

  double _calculateQuotient(String input) {
    List<String> numbers = input.split(',');
    if (numbers.isEmpty) return 0;

    double quotient = double.parse(numbers[0].trim());

    for (int i = 1; i < numbers.length; i++) {
      double divisor = double.parse(numbers[i].trim());
      if (divisor == 0) throw Exception("Cannot divide by zero");
      quotient /= divisor;
    }

    return quotient;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Result: $_result",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    _calculate();
                  },
                  child: SizedBox(
                    height: 10,
                    width: 20,
                    child: Icon(Icons.add),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _calculate();
                  },
                  child: SizedBox(
                    height: 10,
                    width: 20,
                    child: Icon(Icons.add),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _calculate();
                  },
                  child: SizedBox(
                    height: 10,
                    width: 20,
                    child: Icon(Icons.add),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _calculate();
                  },
                  child: SizedBox(
                    height: 10,
                    width: 20,
                    child: Icon(Icons.add),
                  ),
                )
                /*ElevatedButton(
                  onPressed: () => _calculate,
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: () => _calculate,
                  child: Text("*"),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}


void mainTests() {
  group("Calculator Tests", () {
    final calculator = _CalculatorScreenState();

    test("Addition of two numbers", () {
      expect(calculator.add(2, 3), 5);
    });

    test("Subtraction of two numbers", () {
      expect(calculator.subtract(5, 3), 2);
    });

    test("Multiplication of two numbers", () {
      expect(calculator.multiply(4, 3), 12);
    });
  });
}


void mainTest() {
  mainTests();
}
