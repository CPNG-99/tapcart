import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class RegisterSellerPage extends StatefulWidget{
  const RegisterSellerPage({Key? key}) : super(key: key);

  @override
  State<RegisterSellerPage> createState() => _RegisterSellerPageState();
}

class _RegisterSellerPageState extends State<RegisterSellerPage> {
  final _formKey = GlobalKey<FormState>();
  bool securePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Image.asset("assets/img/tapcart.png"),
                  ),
                )
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    obscureText: securePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                            onPressed: () => setState(() =>
                            securePassword = !securePassword
                            ),
                            icon: Icon(
                              securePassword ? Icons.visibility : Icons.visibility_off,
                              color: kGrey,
                            )
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Name",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Address",
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value!.isEmpty){
                        return "This field cannot be empty";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Description",
                    ),
                  ),
                  const SizedBox(height: 50,),
                  ElevatedButton(
                    child: const Text(
                      "Submit",
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LOGIN_SELLER_PAGE);
                    },
                    child: const Text(
                      "Already have an account!",
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