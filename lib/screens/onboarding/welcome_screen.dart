import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onNext;
  WelcomeScreen({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to the App!"),
          ElevatedButton(
            onPressed: onNext,
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
