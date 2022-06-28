import 'package:flutter/material.dart';
import 'package:tapcart/common/constants.dart';

class BuyerDetailCart extends StatefulWidget{
  const BuyerDetailCart({Key? key}) : super(key: key);

  @override
  State<BuyerDetailCart> createState() => _BuyerDetailCartState();
}

class _BuyerDetailCartState extends State<BuyerDetailCart> {
  late int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kGreySoft,
                    border: Border.all(color: kGreySoft)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "https://cdn.discordapp.com/attachments/984772311284584522/985391489251155979/unknown.png",
                    ),
                  ),
                ),
                Center(
                  child: Text("5fd0b08e-e39f-477c-bd1b-e12a4e7cba3e", style: kSubtitle,),
                ),
                SizedBox(height: 30,),
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
                              Text("Pocky Enak", style: kButtonText,),
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
              ],
            ),
            Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: kButtonText,),
                      Text("46.000", style: kButtonText,),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: null,
                    child: Center(
                      child: Text("Delete Cart"),
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}