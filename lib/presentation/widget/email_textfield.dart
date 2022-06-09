import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/validator.dart';

class EmailTextField extends StatelessWidget{
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(!value!.isEmail()){
          return "This field cannot be empty";
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