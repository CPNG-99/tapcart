import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class SellerHomePage extends StatefulWidget{
  const SellerHomePage({Key? key}) : super(key: key);

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children:  <Widget>[
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset("assets/img/tapcart.png"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Toko Duar", style: kSubtitle,),
                          Text("Open", style: kSubtitle,),
                        ],
                      ),
                      const SizedBox(width: 10,),
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/img/first-screen.jpg",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Your Product", style: kButtonText,),
                  const TextField(
                    cursorColor: Colors.grey,
                    cursorHeight: 20,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: "Search",
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Category", style: kSubtitle,),
                  Container(
                    child: Center(
                      child: Text("You don't have any product yet"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Camera',
        child: Icon(Icons.add),
        backgroundColor: kLightBrown,
      ),
    );
  }
}