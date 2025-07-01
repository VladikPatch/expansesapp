import 'package:flutter/material.dart';

class AmountTextField extends StatelessWidget {
  const AmountTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(label: Text('Amount'), prefix: Text('\$')),
      keyboardType: TextInputType.number,
    );
  }
}
