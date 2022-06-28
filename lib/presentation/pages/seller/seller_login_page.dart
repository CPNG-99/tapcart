import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/domain/entities/Auth/auth.dart';
import 'package:tapcart/presentation/bloc/auth/login/login_bloc.dart';
import 'package:tapcart/presentation/widget/email_textfield.dart';
import 'package:tapcart/presentation/widget/password_textfield.dart';

class LoginSellerPage extends StatefulWidget {
  const LoginSellerPage({Key? key}) : super(key: key);

  @override
  State<LoginSellerPage> createState() => _LoginSellerPageState();
}

class _LoginSellerPageState extends State<LoginSellerPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login(email, password) {
    LoginDTO payload = LoginDTO(email: email, password: password);
    context.read<LoginBloc>().add(OnLogin(payload));
  }

  void _setToken(token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(ACCESS_TOKEN, token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                "assets/img/tapcart-medium.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  EmailTextField(controller: _emailController),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordTextField(controller: _passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                    if (state is LoginLoading) {
                      return Column(
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    } else if (state is HasLoginData) {
                      final token = state.token;
                      _setToken(token);
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Navigator.of(context).pushNamed(SELLER_PAGE);
                      });
                    } else if (state is LoginError) {
                      return Column(
                        children: const [
                          Center(
                            child: Text(
                              "Fail to login, please check your email & password",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    }
                    return const Center();
                  }),
                  ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _login(_emailController.text, _passwordController.text);
                        // Navigator.pushNamed(context, SELLER_PAGE);
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
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
