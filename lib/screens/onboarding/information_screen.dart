import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final VoidCallback onNext;
  InformationScreen({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Some Important Information"),
          ElevatedButton(
            onPressed: onNext,
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
