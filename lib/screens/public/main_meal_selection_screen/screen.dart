import 'package:flutter/material.dart';
import '../../../components/meal_details_card.dart';
import '../../../components/meal_option_card.dart';
import '../../../utils/constants/sizes.dart';
import '../../../data/food_data.dart';

class MainMealSelectionScreen extends StatelessWidget {
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType; // Dynamic meal type based on time of day
  final int priceLimit;

  const MainMealSelectionScreen({
    super.key,
    required this.remainingBudget,
    required this.dietaryPreference,
    required this.mealType,
    required this.priceLimit,
  });

  List<Map<String, dynamic>> getFilteredMeals() {
    return foodData.where((meal) {
      return meal['diet'] == dietaryPreference &&
          meal['mealType'] == mealType &&
          meal['price'] <= priceLimit;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = getFilteredMeals();

    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: TSizes.iconMd(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(mealType, // Display mealType as title
            style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeLg(context))),
        actions: [
          Icon(Icons.person, color: Colors.black, size: TSizes.iconMd(context)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.lg(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$$remainingBudget under budget this week",
              style: TextStyle(fontSize: TSizes.fontSizeMd(context)),
            ),
            SizedBox(height: TSizes.md(context)),
            Text(
              "Our top choices for you...",
              style: TextStyle(fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: TSizes.md(context)),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMeals.length,
                itemBuilder: (context, index) {
                  final meal = filteredMeals[index];
                  return MealOptionCard(
                    imageUrl: meal['imageUrl'],
                    name: meal['name'],
                    price: meal['price'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MealDetailsScreen(
                            imageUrl: meal['imageUrl'],
                            name: meal['name'],
                            ingredients: meal['ingredients'],
                            nutritionInfo: meal['nutritionInfo'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle order action
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                  ),
                ),
                child: Text("Order", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
