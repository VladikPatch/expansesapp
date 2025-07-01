import 'package:expenses_app/models/expense.dart';
import 'package:flutter/material.dart';

class CategoryDropdownButton extends StatelessWidget {
  const CategoryDropdownButton({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final Category selectedCategory;
  final ValueChanged<Category> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCategory,
      items:
          Category.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.toUpperCase()),
                ),
              )
              .toList(),
      onChanged: (value) {
        if (value != null) {
          onCategoryChanged(value);
        }
      },
    );
  }
}
