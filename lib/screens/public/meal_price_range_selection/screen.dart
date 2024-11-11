import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../main_meal_selection_screen/screen.dart'; // Import the target screen

class MealPriceSelection extends StatefulWidget {
  final int initialBudget;

  const MealPriceSelection({super.key, required this.initialBudget});

  @override
  MealPriceSelectionState createState() => MealPriceSelectionState();
}

class MealPriceSelectionState extends State<MealPriceSelection> {
  late int remainingBudget;
  int? selectedAmount; // Stores the selected price range amount

  @override
  void initState() {
    super.initState();
    remainingBudget = widget.initialBudget;
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount; // Update the selected amount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections(context),
          horizontal: TSizes.lg(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select price range of meal",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.md(context)),
            Text(
              "\$$remainingBudget under budget this week",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            _buildPriceButton(context, 5, "\$"),
            _buildPriceButton(context, 10, "\$\$"),
            _buildPriceButton(context, 15, "\$\$\$"),
            _buildPriceButton(context, 20, "\$\$\$\$"),
            SizedBox(height: TSizes.spaceBtwSections(context)), // Space before the bottom button
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: selectedAmount != null
                    ? () {
                  // Navigate to MainMealSelectionScreen and pass the necessary parameters
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMealSelectionScreen(
                        remainingBudget: remainingBudget,
                        dietaryPreference: "vegetarian", // TODO Example: Pass selected dietary preference
                        mealType: "lunch", // TODO Example: Pass selected meal type
                        priceLimit: selectedAmount!,
                      ),
                    ),
                  );
                }
                    : null, // Enable only if a selection is made
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceButton(BuildContext context, int amount, String symbol) {
    final isSelected = selectedAmount == amount; // Check if this button is selected
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300], // Highlight if selected
          padding: EdgeInsets.symmetric(horizontal: TSizes.md(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd(context)),
          ),
        ),
        onPressed: () => _selectAmount(amount),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: TSizes.fontSizeLg(context),
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black, // Change text color if selected
              ),
            ),
            Text(
              "\$$amount",
              style: TextStyle(
                fontSize: TSizes.fontSizeLg(context),
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black, // Change text color if selected
              ),
            ),
          ],
        ),
      ),
    );
  }
}
