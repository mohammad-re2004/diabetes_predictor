import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        style: TextStyle(fontFamily: "GR"),
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        validator: (value) {
          if (value == null || value.isEmpty) return 'ورود اطلاعات الزامی است';
          final num = double.tryParse(value.replaceAll(',', '.'));
          if (num == null || num <= 0) return 'مقدار وارد شده معتبر نیست';
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontFamily: "SM"),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFF4361EE), width: 2),
          ),
        ),
      ),
    );
  }
}
