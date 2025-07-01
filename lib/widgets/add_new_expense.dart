import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/theme/color_schemes.dart';
import 'package:expenses_app/theme/text_styles.dart';
import 'package:expenses_app/widgets/amount_text_field.dart';
import 'package:expenses_app/widgets/category_dropdown_button.dart';
import 'package:expenses_app/widgets/date_picker.dart';
import 'package:expenses_app/widgets/title_text_field.dart';
import 'package:flutter/material.dart';

class AddNewExpense extends StatefulWidget {
  const AddNewExpense({super.key, required this.onAddExpense});

  final Function(Expense expense) onAddExpense;

  @override
  State<AddNewExpense> createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Category _selectedCategory = Category.leisure;

  void _onDateChanged(DateTime newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  void _onCategoryChanged(Category newCategory) {
    setState(() {
      _selectedCategory = newCategory;
    });
  }

  void _addExpense() {
    double? amount = double.tryParse(_amountController.text);

    if (_isError(amount)) return;

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: amount!,
        date: _selectedDate,
        category: _selectedCategory,
      ),
    );

    Navigator.pop(context);
  }

  bool _isError(double? amount) {
    bool invalidAmount = amount == null || amount < 0;
    if (_titleController.text.trim().isEmpty || invalidAmount) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Missing Information'),
            content: Text(
              'Please fill in all required fields before creating a new expense.',
              style: TextStyles.bodyMedium(
                kLightColorScheme,
              ).copyWith(fontWeight: FontWeight.normal),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Okay'),
              ),
            ],
          );
        },
      );
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();

    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool portrait = constraints.maxWidth < constraints.maxHeight;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: keyboardSpace + 16,
              ),
              child: Column(
                children: [
                  if (portrait)
                    Column(
                      children: [
                        TitleTextField(controller: _titleController),
                        Row(
                          children: [
                            Expanded(
                              child: AmountTextField(
                                controller: _amountController,
                              ),
                            ),
                            Expanded(
                              child: DatePicker(
                                selectedDate: _selectedDate,
                                onDateChanged: _onDateChanged,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            CategoryDropdownButton(
                              selectedCategory: _selectedCategory,
                              onCategoryChanged: _onCategoryChanged,
                            ),
                            Spacer(),
                            ElevatedButton(
                              onPressed: _addExpense,
                              child: Text('Add Expense'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TitleTextField(
                                controller: _titleController,
                              ),
                            ),
                            SizedBox(width: 32),
                            Expanded(
                              child: AmountTextField(
                                controller: _amountController,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CategoryDropdownButton(
                              selectedCategory: _selectedCategory,
                              onCategoryChanged: _onCategoryChanged,
                            ),
                            Spacer(),
                            DatePicker(
                              selectedDate: _selectedDate,
                              onDateChanged: _onDateChanged,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: _addExpense,
                          child: Text('Add Expense'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
