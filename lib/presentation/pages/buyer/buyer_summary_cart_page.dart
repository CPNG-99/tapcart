import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';
import 'package:tapcart/common/routes.dart';

class BuyerSummaryCartPage extends StatefulWidget{
  const BuyerSummaryCartPage({Key? key}) : super(key: key);

  @override
  State<BuyerSummaryCartPage> createState() => _BuyerSummaryCartPageState();
}

class _BuyerSummaryCartPageState extends State<BuyerSummaryCartPage> {
  late int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Summary'),
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
                          Text("Recheesec Nabati Bites", style: kButtonText,),
                          Text("23.000", style: kSubtitle,),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: counter!=0
                            ? Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: kGreySoft.withOpacity(0.8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState((){
                                        counter=counter-1;
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: kLightBrown,
                                      ),
                                      child: Icon(Icons.remove, size: 13,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(counter.toString())
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState((){
                                        counter=counter+1;
                                      });
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: kLightBrown,
                                      ),
                                      child: Icon(Icons.add, size: 13,color: Colors.white,),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : GestureDetector(
                              onTap: () {
                                setState((){
                                  counter=counter+1;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kGreySoft.withOpacity(0.8),
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: kLightBrown,
                                  ),
                                  child: Icon(Icons.add, size: 13,color: Colors.white,),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: kButtonText,),
                    Text("46.000", style: kButtonText,),
                  ],
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, BUYER_DETAIL_CART_PAGE);
                  },
                  child: Center(
                    child: Text("Create Cart"),
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}