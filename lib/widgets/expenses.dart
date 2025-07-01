import 'package:expenses_app/models/expense.dart';
import 'package:expenses_app/widgets/add_new_expense.dart';
import 'package:expenses_app/widgets/chart/chart.dart';
import 'package:expenses_app/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Clash Royale Battle Pass',
      amount: 8.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Udemy study course',
      amount: 11.99,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _showAddExpenseSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddNewExpense(onAddExpense: _addExpense);
      },
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    int deletedIndex = _expenses.indexOf(expense);
    setState(() {
      _expenses.remove(expense);
    });
    _showSnackBar(deletedIndex, expense);
  }

  void _showSnackBar(int deletedIndex, Expense expense) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('The expense has been deleted'),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(deletedIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    Widget mainContent = Center(
      child: Text(
        'You have no created expenses yet!',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _expenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses'),
        actions: [
          IconButton(onPressed: _showAddExpenseSheet, icon: Icon(Icons.add)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child:
            width < height
                ? Column(
                  children: [
                    Chart(expenses: _expenses),
                    Expanded(child: mainContent),
                  ],
                )
                : Row(
                  children: [
                    Expanded(child: Chart(expenses: _expenses)),
                    Expanded(child: mainContent),
                  ],
                ),
      ),
    );
  }
}
