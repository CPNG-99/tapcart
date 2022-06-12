import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/validator.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (!value!.isEmail()) {
          return "Please input a valid email format";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
}
