import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:  <Widget>[
              SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      child: Image.asset("assets/img/tapcart.png"),
                ),
                  )
              ),
              const SizedBox(height: 100,),
              ClipRRect(
                child: Image.asset("assets/img/first-screen.jpg",
                fit: BoxFit.cover,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Make your shopping easier", style: kHeading,),
                    const SizedBox(height: 10,),
                    Text("We are handle it for you", style: kSubtitle,),
                    const SizedBox(height: 80,),
                    Text("choose your action", style: kSubtitle,),
                    const SizedBox(height: 5,),
                    SizedBox(
                        width: 300,
                        height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: kLightBrown),
                        onPressed: () {
                          Navigator.pushNamed(context, BUYER_PAGE);
                        },
                        child: Text(
                          "Buyer",
                          style: kButtonText,
                        ),
                      )
                    ),
                    const SizedBox(height: 15,),
                    SizedBox(
                      width: 300,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kLightBrown,
                        ),
                        onPressed: () {},
                        child: Text(
                          "Seller",
                          style: kButtonText,
                        ),
                      )
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