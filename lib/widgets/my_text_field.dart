import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  const MyTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        labelText: 'Enter City Name',
        suffixIcon: IconButton(
            onPressed: () => controller.clear(), icon: const Icon(Icons.close)),
      ),
    );
  }
}
