import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Image.asset("assets/img/tapcart.png"),
              ),
            )),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ClipRRect(
                child: Image.asset(
                  "assets/img/first-screen.jpg",
                  height: 174,
                  width: 300,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Make your shopping easier",
                    style: kHeading,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We are handle it for you",
                    style: kSubtitle,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "choose your action",
                    style: kSubtitle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BUYER_PAGE);
                    },
                    child: const Text('Buyer'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      String? token = pref.getString(ACCESS_TOKEN);
                      if (token != null) {
                        Navigator.pushNamed(context, SELLER_PAGE);
                      } else {
                        Navigator.pushNamed(context, LOGIN_SELLER_PAGE);
                      }
                    },
                    child: const Text('Seller'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
