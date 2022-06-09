import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/presentation/widget/email_textfield.dart';
import 'package:tapcart/presentation/widget/password_textfield.dart';

class LoginSellerPage extends StatefulWidget{
  const LoginSellerPage({Key? key}) : super(key: key);

  @override
  State<LoginSellerPage> createState() => _LoginSellerPageState();
}

class _LoginSellerPageState extends State<LoginSellerPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: Image.asset("assets/img/tapcart-medium.png",
                fit: BoxFit.cover,),
            ),
            const SizedBox(height: 50,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const EmailTextField(),
                  const SizedBox(height: 10,),
                  const PasswordTextField(),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, REGISTER_SELLER_PAGE);
                    },
                    child: const Text(
                      "Don't have any account?",
                      style: TextStyle(color: kGrey),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}