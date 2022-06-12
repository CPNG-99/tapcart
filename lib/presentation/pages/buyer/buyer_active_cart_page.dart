import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class BuyerActiveCartPage extends StatefulWidget{
  const BuyerActiveCartPage({Key? key}) : super(key: key);

  @override
  State<BuyerActiveCartPage> createState() => _BuyerActiveCartPageState();
}

class _BuyerActiveCartPageState extends State<BuyerActiveCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Active Cart Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.pushNamed(context, BUYER_SCAN_PAGE);
        },
        tooltip: 'Add Product',
        child: Icon(Icons.qr_code_scanner),
        backgroundColor: kLightBrown,
      ),
    );
  }
}