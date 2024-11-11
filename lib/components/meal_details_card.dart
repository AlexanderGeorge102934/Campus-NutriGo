import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class MealDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String ingredients;
  final String nutritionInfo;

  const MealDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.ingredients,
    required this.nutritionInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: TSizes.iconMd(context)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Nutritional Details",
          style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeLg(context)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.lg(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: TSizes.imageThumbSize * 1.5, fit: BoxFit.cover),
            SizedBox(height: TSizes.md(context)),
            Text(
              name,
              style: TextStyle(fontSize: TSizes.fontSizeXXl(context), fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.md(context)),
            Text(
              "Ingredients",
              style: TextStyle(fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: TSizes.sm(context)),
            Text(ingredients, textAlign: TextAlign.center, style: TextStyle(fontSize: TSizes.fontSizeMd(context))),
            SizedBox(height: TSizes.md(context)),
            Text(
              "Nutrition Facts",
              style: TextStyle(fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: TSizes.sm(context)),
            Text(nutritionInfo, textAlign: TextAlign.center, style: TextStyle(fontSize: TSizes.fontSizeMd(context))),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add to order or proceed with order action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                ),
              ),
              child: Text("Order", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
            ),
          ],
        ),
      ),
    );
  }
}
