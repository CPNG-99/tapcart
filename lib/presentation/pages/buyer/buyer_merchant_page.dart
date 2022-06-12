import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';
import 'package:tapcart/presentation/widget/buyer_card_product.dart';

class BuyerMerchantPage extends StatefulWidget{
  const BuyerMerchantPage({Key? key}) : super(key: key);

  @override
  State<BuyerMerchantPage> createState() => _BuyerMerchantPage();
}

class _BuyerMerchantPage extends State<BuyerMerchantPage> {

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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset("assets/img/tapcart.png"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              "assets/img/first-screen.jpg",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Toko Duar", style: kSubtitle,),
                              Text("Open", style: kSubtitle,),
                            ],
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(
                            Icons.bookmark_outline, color: kLightBrown, size: 40,
                          ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
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
                  const SizedBox(height: 20,),
                  Text("Category", style: kSubtitle,),
                  SizedBox(
                    width: 500,
                    child: GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        BuyerCardProduct(),
                        BuyerCardProduct(),
                        BuyerCardProduct(),
                        BuyerCardProduct(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, BUYER_SUMMARY_CART_PAGE);
        },
        tooltip: 'Summary',
        child: Icon(Icons.shopping_cart),
        backgroundColor: kLightBrown,
      ),
    );
  }
}