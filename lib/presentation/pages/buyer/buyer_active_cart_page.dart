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
      appBar: AppBar(
        title: const Text('Active Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: kGrey, width: 0.2),
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: kGrey,
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
                      child: Image.network(
                        "https://cdn.discordapp.com/attachments/984772311284584522/985561450414219304/unknown.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("store name", style: kButtonText,),
                          Text("5fd0b08e-e39f-477c-bd1b-e12a4e7cba3e", style: kSubtitle,),
                          Text("46000", style: kSubtitle,),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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