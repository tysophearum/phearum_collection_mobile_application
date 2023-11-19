import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.name, required this.onPress,
  });

  final String name;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { onPress(); },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.orange, width: 3),
            borderRadius: const BorderRadius.all(Radius.circular(9))
        ),
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.orange
          ),
        ),
      ),
    );
  }
}
