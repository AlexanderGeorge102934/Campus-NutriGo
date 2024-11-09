import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class WeeklyBudgetScreen extends StatefulWidget {
  const WeeklyBudgetScreen({super.key});

  @override
  WeeklyBudgetScreenState createState() => WeeklyBudgetScreenState();
}

class WeeklyBudgetScreenState extends State<WeeklyBudgetScreen> {
  String budget = "0";

  void _addDigit(String digit) {
    setState(() {
      if (budget == "0") {
        budget = digit;
      } else {
        budget += digit;
      }
    });
  }

  void _clearBudget() {
    setState(() {
      budget = "0";
    });
  }

  void _submitBudget() {
    // Navigate to the main app or perform other actions
    Navigator.pushReplacementNamed(context, '/main'); // Replace '/main' with your main screen route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections(context),
          horizontal: TSizes.lg(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What is your weekly budget?",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            Container(
              padding: EdgeInsets.all(TSizes.md(context)),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(TSizes.borderRadiusMd(context)),
              ),
              child: Text(
                "\$$budget",
                style: TextStyle(
                  fontSize: TSizes.fontSizeXXl(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            _buildKeypad(context),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: TSizes.spaceBtwItems(context),
        crossAxisSpacing: TSizes.spaceBtwItems(context),
        padding: EdgeInsets.symmetric(horizontal: TSizes.lg(context)),
        children: [
          ...List.generate(9, (index) {
            final digit = (index + 1).toString();
            return _buildKey(digit, () => _addDigit(digit));
          }),
          _buildKey("C", _clearBudget, Colors.red), // Clear button
          _buildKey("0", () => _addDigit("0")),
          _buildKey("✔", _submitBudget, Colors.green), // Submit button
        ],
      ),
    );
  }

  Widget _buildKey(String label, VoidCallback onPressed, [Color? color]) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(TSizes.borderRadiusSm(context)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: TSizes.fontSizeXl(context),
              fontWeight: FontWeight.bold,
              color: color == null ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
