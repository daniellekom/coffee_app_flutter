import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
final String coffeeType;
final bool isSelected;

 CoffeeType({
   required this.coffeeType, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
          coffeeType,
        style: TextStyle(fontSize: 18,
        fontWeight: FontWeight.bold,
          color: Colors.orange
        ),
      ),
    );
  }
}
