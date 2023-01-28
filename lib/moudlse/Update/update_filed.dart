
import 'package:flutter/material.dart';

class UpdateField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  TextInputType type;
  Function(String) onchange;
String?   Function(String?) validator;

  UpdateField(this.type,this.controller,this.hint,this.onchange,this.validator);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
        color: Theme.of(context).colorScheme.onSecondary
      ),
    keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
      ),
      onChanged: onchange,
      validator: validator,
    );
  }
}
