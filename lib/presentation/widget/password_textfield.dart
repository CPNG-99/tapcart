import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool securePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return "This field cannot be empty";
        }
        return null;
      },
      obscureText: securePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          hintText: "Password",
          suffixIcon: IconButton(
              onPressed: () => setState(() => securePassword = !securePassword),
              icon: Icon(
                securePassword ? Icons.visibility : Icons.visibility_off,
                color: kGrey,
              ))),
    );
  }
}
