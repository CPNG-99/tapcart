import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class SellerDetailProduct extends StatefulWidget{
  @override
  State<SellerDetailProduct> createState() => _SellerDetailProductState();
}

class _SellerDetailProductState extends State<SellerDetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://cdn.discordapp.com/attachments/856786757516918784/984871033486078012/pexels-riccardo-bertolo-4245826.jpg",
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.4),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Toko Duar", style: kHeading,),
                      Text("Rp 10.000", style: kHeading,),
                    ],
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